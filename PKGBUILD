# Maintainer: Det <nimetonmaili g-mail>

pkgname=jdk-docs
_major=9
_minor=0
_build=181
pkgver=${_major}u${_minor}
pkgrel=1
pkgdesc="Documentation for Oracle Java Development Kit"
arch=('any')
url="http://www.oracle.com/technetwork/java/javase/downloads/index.html"
license=('custom:Oracle')
optdepends=("java-environment>=$_major: Compile and run examples")
options=('!strip')
#source=("http://download.oracle.com/otn-pub/java/jdk/${pkgver}-${_build}/${_hash}/jdk-${pkgver}-docs-all.zip"
source=("http://download.oracle.com/otn-pub/java/jdk/${_major}+${_build}/jdk-${_major}_doc-all.zip")
md5sums=('f7f540e6cc3ff25f0a393ece9128ee6c')

DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -b oraclelicense=a -o %o %u')

package() {
  # Install
  install -d "$pkgdir"/usr/share/doc/java$_major/
  mv docs/* "$pkgdir"/usr/share/doc/java$_major/

  # License
  install -Dm644 LICENSE-Oracle-Legal-Notices.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
