# Maintainer: Petteri Tolonen <petteri dot tolonen at gmail dot com>

pkgname=freedink
pkgver=108.4
pkgrel=1
pkgdesc="A free and enhanced version of the Dink Smallwood game engine"
arch=('i686' 'x86_64' 'mips64el')
url="http://www.freedink.org/"
license=('GPL3')
depends=('fontconfig' 'freedink-data' 'sdl_gfx' 'sdl_image' 'sdl_mixer' 'sdl_ttf')
makedepends=('check')
optdepends=('timidity++: MIDI-music support')
source=(http://ftp.gnu.org/gnu/freedink/$pkgname-$pkgver.tar.gz)
sha256sums=('82cfb2e019e78b6849395dc4750662b67087d14f406d004f6d9e39e96a0c8521')

package() {

   cd $srcdir/$pkgname-$pkgver/
   
   ./configure --prefix=/usr --disable-embedded-resources
   make
   make install DESTDIR=$pkgdir

}
