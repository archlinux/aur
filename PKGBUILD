# Maintainer: Petteri Tolonen <petteri dot tolonen at gmail dot com>

pkgname=freedink
pkgver=1.08.20121209
pkgrel=2
pkgdesc="A free and enhanced version of the Dink Smallwood game engine"
arch=('i686' 'x86_64' 'mips64el')
url="http://www.freedink.org/"
license=('GPL3')
depends=('fontconfig' 'freedink-data' 'sdl_gfx' 'sdl_image' 'sdl_mixer' 'sdl_ttf')
optdepends=('timidity++: MIDI-music support')
conflicts=('freedink-git' 'freedink-engine')
replaces=('freedink-git' 'freedink-engine')
source=(http://ftp.gnu.org/gnu/freedink/$pkgname-$pkgver.tar.gz)
md5sums=('c63fe38ab68158ded2a8039cbec2c8e3')

package() {

   cd $srcdir/$pkgname-$pkgver/
   
   ./configure --prefix=/usr --disable-embedded-resources
   make
   make install DESTDIR=$pkgdir

}
