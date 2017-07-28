# Maintainer: Det
# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=('jdk-docs' 'javafx-docs')
_major=8
_minor=144
_minor_javafx=141
_build=b01
_build_javafx=b14
_hash=090f390dda5b47b9b721c7dfaa008135
pkgver=${_major}u${_minor}
pkgrel=2
arch=('any')
url="http://www.oracle.com/technetwork/java/javase/downloads/index.html"
license=('custom:Oracle')
optdepends=("java-environment>=$_major: Compile and run examples")
options=('!strip')
source=("http://download.oracle.com/otn-pub/java/jdk/${pkgver}-${_build}/${_hash}/jdk-${pkgver}-docs-all.zip"
        "http://download.oracle.com/otn-pub/java/javafx/${_major}.0.${_minor}-${_build_javafx}/${_hash}/javafx-${pkgver}-apidocs.zip"
        'LICENSE-Documentation.txt'
        'LICENSE-Oracle-Legal-Notices.txt')
md5sums=('739986e75020948fab09b27f4ebd626a'
         '477d9862374177c810b0b7d73b4f1e53'
         '4d54057ca75b691366977dab2277e869'
         '3137397f4dba13f4a79157819af583a3')

DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -b oraclelicense=a -o %o %u')

package_jdk-docs() {
  pkgdesc="Documentation for Oracle Java Development Kit"
  
  # Install
  install -d "$pkgdir"/usr/share/doc/java/
  mv docs/* "$pkgdir"/usr/share/doc/java/

  # License
  install -Dm644 LICENSE-Documentation.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_javafx-docs() {
  pkgdesc="Documentation for Oracle JavaFX Development Kit"
  
  # Install
  install -d "$pkgdir"/usr/share/doc/java/javafx/
  mv api "$pkgdir"/usr/share/doc/java/javafx/

  # License
  install -Dm644 LICENSE-Oracle-Legal-Notices.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
