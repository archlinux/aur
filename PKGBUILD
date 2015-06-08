# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=clib
pkgver=1.4.2
pkgrel=1
pkgdesc="C package manager-ish"
arch=(i686 x86_64)
url="https://github.com/clibs/clib"
license=('MIT')
depends=('curl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/clibs/clib/archive/$pkgver.tar.gz")
sha256sums=('c1f3d98a10955a4ce6c2c100b1ffd341d5e99dcf6e642793d3bfa4ff4a431e13')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}
