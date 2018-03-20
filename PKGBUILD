# Maintainer: Det <nimetonmaili g-mail>

_pkgname=jdk-docs
pkgname=jdk9-docs
pkgver=9.0.4
_major=${pkgver/.*}
_build=11
_hash=c2514751926b4512b076cc82f959763f
pkgrel=1
pkgdesc="Documentation for Oracle Java 9 Development Kit"
arch=('any')
url="http://www.oracle.com/technetwork/java/javase/downloads/index.html"
license=('custom:Oracle')
optdepends=("java-environment>=$_major: Compile and run examples")
options=('!strip')
source=("http://download.oracle.com/otn-pub/java/jdk/${pkgver}+${_build}/${_hash}/jdk-${pkgver}_doc-all.zip"
        'LICENSE-Oracle-Legal-Notices.txt')
sha256sums=('66a7e0948f109020bfb5483848e9998b2624043074d7aae974e89e85a6e14d37'
            '01ce75a25c01b3984ff8ad08b0ad8bb24b071316d2ebf5113661ceda76f51a81')

DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -b oraclelicense=a -o %o %u')

package() {
  # Install
  install -d "$pkgdir"/usr/share/doc/java$_major/
  mv docs/* "$pkgdir"/usr/share/doc/java$_major/

  # License
  install -Dm644 LICENSE-Oracle-Legal-Notices.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
