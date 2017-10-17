# Maintainer: Det
# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=('jdk8-docs' 'javafx8-docs')
_major=8
_minor=152
_build=b16
_hash=aa0333dd3019491ca4f6ddbe78cdb6d0
pkgver=${_major}u${_minor}
pkgrel=1
arch=('any')
url="http://www.oracle.com/technetwork/java/javase/downloads/index.html"
license=('custom:Oracle')
optdepends=("java-environment>=$_major: Compile and run examples")
options=('!strip')
source=("http://download.oracle.com/otn-pub/java/jdk/${pkgver}-${_build}/${_hash}/jdk-${pkgver}-docs-all.zip"
        "http://download.oracle.com/otn-pub/java/javafx/${_major}.0.${_minor}-${_build}/${_hash}/javafx-${pkgver}-apidocs.zip"
        'LICENSE-Documentation.txt'
        'LICENSE-Oracle-Legal-Notices.txt')
md5sums=('f76e105b7fc62b0ae143308e05e1a92a'
         'b795c160321a49826bd49ce8b2dea99d'
         '4d54057ca75b691366977dab2277e869'
         '3137397f4dba13f4a79157819af583a3')

DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -b oraclelicense=a -o %o %u')

package_jdk8-docs() {
  pkgdesc="Documentation for Oracle Java $_major Development Kit"
  
  # Install
  install -d "$pkgdir"/usr/share/doc/java$_major/
  mv docs/* "$pkgdir"/usr/share/doc/java$_major/

  # License
  install -Dm644 LICENSE-Documentation.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_javafx8-docs() {
  pkgdesc="Documentation for Oracle JavaFX $_major Development Kit"
  
  # Install
  install -d "$pkgdir"/usr/share/doc/java/javafx$_major/
  mv api "$pkgdir"/usr/share/doc/java/javafx$_major/

  # License
  install -Dm644 LICENSE-Oracle-Legal-Notices.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
