# Maintainer: emersion <contact emersion fr>

pkgname='xcb-util-errors'
pkgver=1.0
pkgrel=1
pkgdesc='XCB errors library'
arch=('x86_64')
url='https://cgit.freedesktop.org/xcb/util-errors/'
license=('custom:MIT')
depends=('libxcb')
source=("https://xcb.freedesktop.org/dist/xcb-util-errors-$pkgver.tar.bz2")
sha1sums=('c72516e48e95f3d76780664ef14cda2f066f5088')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
