# Maintainer: Det <nimetonmaili g-mail>

pkgname=jdk-devel-docs
pkgver=9.0.1
_major=${pkgver/.*}
_build=11
pkgrel=1
pkgdesc="Documentation for Oracle Java $_major Development Kit Snapshot"
arch=('any')
url="http://jdk.java.net/$_major/"
license=('custom:Oracle')
optdepends=("java-environment>=$_major: Compile and run examples")
options=('!strip')
source=("http://download.oracle.com/otn-pub/java/jdk/${pkgver}+${_build}/jdk-${pkgver}_doc-all.zip"
        'LICENSE-Oracle-Legal-Notices.txt')
sha256sums=('79c375220326cfcd38c6ae15bce6e99ae866c7e477fb48fdf9221fe5742b786c'
            '01ce75a25c01b3984ff8ad08b0ad8bb24b071316d2ebf5113661ceda76f51a81')

DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -b oraclelicense=a -o %o %u')

package() {
  # Install
  install -d "$pkgdir"/usr/share/doc/java$_major/
  mv docs/* "$pkgdir"/usr/share/doc/java$_major/

  # License
  install -Dm644 LICENSE-Oracle-Legal-Notices.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
