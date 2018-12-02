# Maintainer:
# Contributor: oke3 <Sekereg at gmx dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Cirrus <nailzuk at gmail dot com>

pkgname=mp3blaster
pkgver=3.2.6
pkgrel=1
pkgdesc="A console based mp3 and OGG player"
arch=('i686' 'x86_64')
url="http://mp3blaster.sourceforge.net"
license=('GPL')
depends=('ncurses' 'libvorbis' 'sdl' 'libsidplay')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stragulus/mp3blaster/archive/v$pkgver.tar.gz")
sha256sums=('2b8902a220fee43ee76bd55d5a7f7fd51a3faf8db721a3402b442f1b6e1ef518')

build() {
  cd $pkgname-$pkgver

  CXXFLAGS+=' -Wno-narrowing'

  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
