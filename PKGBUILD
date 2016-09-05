# Valerio Pizzi (Pival81) <pival81@yahoo.com>

pkgname=doomsday-bin
_pkgname=doomsday
pkgver=2.0.0
pkgrel=2072
pkgdesc="An advanced Doom engine that supports DOOM, Heretic and Hexen."
url="http://dengine.net/"
arch=('x86_64')
license=('GPL2')
conflicts=('doomsday2-unstable' 'i686-doomsday2-unstable' 'doomsday')
depends=('qt5-base' 'qt5-x11extras' 'sdl2_net' 'sdl2_mixer' 'fmodex' 'wxpython' 'assimp' 'fluidsynth' 'soundfont-fluid' )
conflicts=('doomsday')
provides=('doomsday')
optdepends=('doom1-wad: Doom shareware', 
            'heretic1-wad: Heretic shareware', 
            'hexen1-wad: Hexen shareware')
source=("http://files.dengine.net/builds/build${pkgrel}/${_pkgname}-${pkgver}-build${pkgrel}-1.x86_64.rpm")
md5sums=('f49f8033b1aa8538c47a4e1d36d8e58f')

package() {
	cd $pkgdir
	bsdtar -xf $srcdir/${_pkgname}-${pkgver}-build${pkgrel}-1.x86_64.rpm
	mv usr/lib64 usr/lib
	rm -rf usr/include/assimp
}
