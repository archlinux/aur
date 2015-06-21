# Maintainer: schuay <jakob.gruber@gmail.com>
 
pkgname=pacman_sdl
pkgver=0.1.1
pkgdesc="Pacman clone using SDL. Guide Pacman through a maze and collect pac-dots while avoiding ghosts."
pkgrel=2
arch=('i686' 'x86_64')
url="http://github.com/schuay/pacman/"
license=('GPL')
source=("https://github.com/downloads/schuay/pacman/pacman-$pkgver.tar.bz2")
md5sums=('8cc780d3995579c329f297455899fff5')
depends=('sdl_ttf' 'sdl_gfx' 'sdl_mixer' 'sdl_image')
makedepends=('boost')

build() {
  cd ${srcdir}/src/

  autoconf
  ./configure
  make
}
package() {
  cd ${srcdir}/src/

  make DESTDIR=${pkgdir} install
}
