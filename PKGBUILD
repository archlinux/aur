# Maintainer: Michael Czigler <info at mcpcpc dot com>

pkgname=xwm
pkgver=0.1.6
pkgrel=1
pkgdesc="A tiny XCB floating window manager"
url="http://github.com/mcpcpc/xwm"
arch=('x686' 'x86_64')
license=('MIT')
depends=(xcb-util-keysyms)
source=("$url/archive/$pkgver.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -TDm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
