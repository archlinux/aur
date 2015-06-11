# Contributor: Feufochmar <feufochmar@d-20.fr>
pkgname=xcpc
pkgver=20070122
pkgrel=2
pkgdesc="An Amstrad CPC emulator"
arch=('i686' 'x86_64')
url="http://www.xcpc-emulator.net/doku.php/index"
license=('GPL')
depends=('libdsk' 'lesstif')
optdepends=()
source=(http://downloads.sourceforge.net/sourceforge/xcpc/$pkgname-$pkgver.tar.gz)
md5sums=('6b9d1c94b37e1cc10312dd46bd0696b7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

