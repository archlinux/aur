# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=x-corners
pkgver=0.2.2
pkgrel=1
pkgdesc='A command line tool to set up hot corners under X11'
arch=('i686' 'x86_64')
license=('ISC')
url='https://github.com/mstraube/x-corners'
depends=('libxi')
makedepends=('libxfixes')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mstraube/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('e784c2e0b5fabb652b8f44231c94a2487a7914eee610d1f4cb1561d224fcf9d2')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
