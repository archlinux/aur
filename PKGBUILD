# Maintainer: Olaf Bauer <hydro@freenet.de>

pkgname=udfclient
pkgver=0.8
pkgrel=1
pkgdesc="a userland implementation of the UDF filingsystem"
arch=('i686' 'x86_64')
url="http://www.13thmonkey.org/udfclient/"
license=('custom:Clarified Artistic')
depends=(glibc)
makedepends=('bmake')
source=(${url}releases/UDFclient.$pkgver.tgz)
md5sums=('573b0ced0d591c2b5db0e43524aaacc8')

build() {
  cd "$srcdir/UDFclient.$pkgver"
  ./configure --prefix=/usr
  bmake
}

package() {
  cd "$srcdir/UDFclient.$pkgver"
  install -d "$pkgdir/usr/bin"
  bmake prefix="$pkgdir/usr" install
  install -Dm 644 LICENCE.clearified.artistic "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
