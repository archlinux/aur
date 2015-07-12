# Contributor: Boris Timofeev <mashin87@gmail.com>
pkgname=neopop_sdl
pkgver=0.2
pkgrel=2
pkgdesc="NeoGeo Pocket emulator."
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.nih.at/NeoPop-SDL/"
depends=('sdl' 'libpng' 'zlib')
makedepends=()
install=
source=(http://www.nih.at/NeoPop-SDL/NeoPop-SDL-$pkgver.tar.gz)
md5sums=('a705816f823fe2cf85410ea74a57763f')


build() {
  cd $srcdir/NeoPop-SDL-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/NeoPop-SDL-$pkgver/System_SDL
  install -D -m 755 ./NeoPop-SDL $pkgdir/usr/bin/neopop
  
  gzip NeoPop-SDL.6
  gzip neopoprc.5
  install -D -m 644 NeoPop-SDL.6.gz $pkgdir/usr/share/man/man6/neopop.6.gz
  install -D -m 644 neopoprc.5.gz $pkgdir/usr/share/man/man5/neopoprc.5.gz
}

