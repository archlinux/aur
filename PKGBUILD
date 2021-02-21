#  Maintainer: Loui Chang <base64:bG91aXBjLmlzdEBnbWFpbC5jb20=>
# Contributor: Matthias Hueser <mail at mhueser dot de>
# Contributor: Daniel Griffiths <ghost1227 at archlinux dot us>

pkgname=rolo
pkgver=014
pkgrel=1
pkgdesc="Tracks contacts with vCards and displays them with a text-based menu."
arch=('i686' 'x86_64')
url="https://github.com/libvc/rolo"
license=('GPL')
depends=('ncurses' 'libvc' 'libunac')
source=(rolo-014.tar.gz::https://github.com/libvc/rolo/archive/v014.tar.gz)

build() {
  cd $srcdir/$pkgname-$pkgver

  autoreconf -i -f
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

sha256sums=('d5db41f0633996f6f36bc5997d06d79705d36e35a6c876d2f6eeaef55aac0e16')
