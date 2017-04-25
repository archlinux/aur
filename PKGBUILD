# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=x-corners
pkgver=0.2.4
pkgrel=1
pkgdesc='A command line tool to set up hot corners under X11'
arch=('i686' 'x86_64')
license=('ISC')
url='https://github.com/mstraube/x-corners'
depends=('libxi')
makedepends=('libxfixes')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mstraube/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('a11844c1fa7780c6fa57adb3b2fdc26b0d8bbb42cd8ffd476316245a4ec9d918')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
