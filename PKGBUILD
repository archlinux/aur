# Maintainer: Olaf Bauer <hydro@freenet.de>

pkgname=udfclient
pkgver=0.8.21
pkgrel=1
pkgdesc="a userland implementation of the UDF filingsystem"
arch=('x86_64')
url="https://www.13thmonkey.org/udfclient/"
license=('LicenseRef-Clarified Artistic')
depends=(glibc)
makedepends=('bmake')
source=(${url}releases/UDFclient.${pkgver}.tgz)
sha256sums=('83deab4d97d8e5f67baa47aa779c41d35b5f5ef348bcea36bebb1549534c6f5e')

build() {
  cd "$srcdir/UDFclient.$pkgver"
  ./configure --prefix=/usr
  bmake
}

package() {
  cd "$srcdir/UDFclient.$pkgver"
  install -d "$pkgdir/usr/bin"
  bmake prefix="$pkgdir/usr" install
  install -Dm 644 LICENCE.clearified.artistic "$pkgdir/usr/share/licenses/${pkgname}/LICENCE"
}
