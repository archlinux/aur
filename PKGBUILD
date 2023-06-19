# Maintainer: Parker Reed <parker.l.reed@gmail.com>
# Valerio Pizzi (Pival81) <pival81@yahoo.com>

pkgname=doomsday-bin
_pkgname=doomsday
pkgver=2.3.1
pkgrel=1
pkgdesc="An advanced Doom engine that supports DOOM, Heretic and Hexen."
url="http://dengine.net/"
arch=('x86_64')
license=('GPL2')
conflicts=('doomsday2-unstable' 'i686-doomsday2-unstable' 'doomsday')
depends=('qt5-base' 'qt5-x11extras' 'sdl2_net' 'sdl2_mixer' 'fmodex' 'python-wxpython' 'assimp' 'fluidsynth' 'soundfont-fluid')
conflicts=('doomsday')
provides=('doomsday')
optdepends=('doom1-wad: Doom shareware', 
            'heretic1-wad: Heretic shareware', 
            'hexen1-wad: Hexen shareware')
source=("${_pkgname}-${pkgver}-1.x86_64.rpm::http://api.dengine.net/1/builds?dl=${_pkgname}-${pkgver}-1.x86_64.rpm")
sha256sums=('04312dd2373e4cf8c6e13d7206e267af6a562fd6caeb884fcba75ba34ba48112')

package() {
	cd $pkgdir
	bsdtar -xf $srcdir/${_pkgname}-${pkgver}-1.x86_64.rpm
	mv usr/lib64 usr/lib
	rm -rf usr/include/assimp
}
