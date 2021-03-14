# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=wxedid
pkgver=0.0.23
pkgrel=1
pkgdesc="wxWidgets-based EDID (Extended Display Identification Data) editor"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/wxedid/"
license=('GPL3')
depends=('wxgtk2')
options=('!buildflags')
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('6b8ceaa8bff41a93f3d740727677c5ac')

build() {
  cd "$pkgname-$pkgver"
  autoreconf -f -i
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
