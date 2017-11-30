# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=clib
pkgver='1.8.1'
pkgrel=1
pkgdesc="C package manager-ish"
arch=(i686 x86_64)
url="https://github.com/clibs/clib"
license=('MIT')
depends=('curl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/clibs/clib/archive/$pkgver.tar.gz")
sha512sums=('45cf50bd4d676e904d10ceddf0784ef687d4ce2eeb16447a8e8d6694396bcaf5dc3dd8e72fc4a67651f064d772983b4ccd0e9d8b3a3cc46108f1303dab6e4832')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
