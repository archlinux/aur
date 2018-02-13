# Maintainer: Parker Reed <parker.l.reed@gmail.com>
# Valerio Pizzi (Pival81) <pival81@yahoo.com>

pkgname=doomsday-bin
_pkgname=doomsday
pkgver=2.0.3
pkgrel=1
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
source=("${_pkgname}-${pkgver}-1.x86_64.rpm::http://api.dengine.net/1/builds?dl=${_pkgname}-${pkgver}-1.x86_64.rpm")
md5sums=('d62533e21de83c4fd882dee421a1a50b')

package() {
	cd $pkgdir
	bsdtar -xf $srcdir/${_pkgname}-${pkgver}-1.x86_64.rpm
	mv usr/lib64 usr/lib
	rm -rf usr/include/assimp
}
