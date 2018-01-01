# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Calle Erlandsson <calle@calleerlandsson.com>

pkgname=pick
pkgver=2.0.1
pkgrel=1
pkgdesc='A fuzzy search tool for the command line'
arch=('i686' 'x86_64')
url='https://github.com/calleerlandsson/pick'
license=('MIT')
depends=('ncurses')
source=("https://github.com/calleerlandsson/pick/releases/download/v$pkgver/pick-$pkgver.tar.gz")
sha256sums=('4a596b8f40a316bc4e2c0d8e8842810d7a7b69d464a410e4ee2a6574e01629e3')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname-$pkgver
  make -k check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
