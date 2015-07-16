# Maintainer: Det
# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=jdk-docs
#pkgname=('jdk-docs' 'javafx-docs')
_major=8
_minor=51
_build=b16
pkgver=${_major}u${_minor}
pkgrel=1
pkgdesc="Documentation for Oracle Java Development Kit"
arch=('any')
url="http://www.oracle.com/technetwork/java/javase/downloads/index.html"
license=('custom:Oracle')
optdepends=("java-runtime>=$_major: Run the examples"
            "java-environment>=$_major: Compile and run the examples")
options=('!strip')
source=("http://download.oracle.com/otn-pub/java/jdk/$pkgver-$_build/jdk-$pkgver-docs-all.zip"
        "http://download.oracle.com/otn-pub/java/javafx/$_major.0.$_minor-$_build/javafx-$pkgver-apidocs.zip"
        'LICENSE-Documentation'
        'LICENSE-JavaFX')
md5sums=('319c85a9b3e282749b53df07fda2cb94'
         '7d0053378c31298c3a32df53894710c0'
         '4d54057ca75b691366977dab2277e869'
         'b2a9fa7a855645ba5e1ea2ea555cce25')

DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -b oraclelicense=a -o %o %u')

package() {
#package_jdk-docs() {
  # Install
  install -d "$pkgdir"/usr/share/doc/java/
  mv docs/* "$pkgdir"/usr/share/doc/java/

  # License
  install -d "$pkgdir"/usr/share/licenses/$pkgname/
  install -m644 LICENSE-Documentation "$pkgdir"/usr/share/licenses/$pkgname/
  #install -Dm644 LICENSE-Documentation "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
#}
#package_javafx-docs() {
  # Install
  install -d "$pkgdir"/usr/share/doc/java/javafx/
  mv api "$pkgdir"/usr/share/doc/java/javafx/

  # License
  install -d "$pkgdir"/usr/share/licenses/$pkgname/
  install -m644 LICENSE-JavaFX "$pkgdir"/usr/share/licenses/$pkgname/
  #install -Dm644 LICENSE-JavaFX "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
