# Maintainer: Olaf Bauer <hydro@freenet.de>

pkgname=udfclient
pkgver=0.8.11
pkgrel=1
pkgdesc="a userland implementation of the UDF filingsystem"
arch=('i686' 'x86_64')
url="http://www.13thmonkey.org/udfclient/"
license=('custom:Clarified Artistic')
depends=(glibc)
makedepends=('bmake')
source=(${url}releases/UDFclient.$pkgver.tgz)
md5sums=('b1c5c72ee6f02050349af62ad554a5b9')

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
