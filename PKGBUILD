# Maintainer: Det
# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=('jdk-docs' 'javafx-docs')
_major=8
_minor=45
_build=b14
pkgver=${_major}u${_minor}
pkgrel=1
pkgdesc="Documentation for Oracle Java Development Kit"
arch=('any')
url="http://www.oracle.com/technetwork/java/index.html"
license=('custom:Oracle')
optdepends=("java-runtime>=$_major: Run the examples"
            "java-environment>=$_major: Compile and run the examples")
options=('!strip')
source=("http://download.oracle.com/otn-pub/java/jdk/$pkgver-$_build/jdk-$pkgver-docs-all.zip"
        "http://download.oracle.com/otn-pub/java/javafx/$_major.0.$_minor-$_build/javafx-$pkgver-apidocs.zip"
        'LICENSE-Documentation'
        'LICENSE-JavaFX')
md5sums=('ad1bee41ba1f17e81fe09b983ae6adba'
         'ecd9f7c34acf8c06ebe50b3e2a6440f1'
         '4d54057ca75b691366977dab2277e869'
         'b2a9fa7a855645ba5e1ea2ea555cce25')

DLAGENTS=('http::/usr/bin/curl -LC - -b oraclelicense=a -O')

package_jdk-docs() {
  # Install
  install -d "$pkgdir"/usr/share/doc/java/
  mv docs/* "$pkgdir"/usr/share/doc/java/

  # License
  install -Dm644 LICENSE-Documentation "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_javafx-docs() {
  # Install
  install -d "$pkgdir"/usr/share/doc/java/javafx/
  mv api "$pkgdir"/usr/share/doc/java/javafx/

  # License
  install -Dm644 LICENSE-JavaFX "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
