# Maintainer:   Nascher <kevin at nascher dot org>
# Contributor:  Menche <menche_mt at yahoo dot com>

pkgname=voxelands
pkgver=1510.00
pkgrel=1
pkgdesc="A fork of Minetest, an Infiniminer/Minecraft inspired game"
url="http://voxelands.com"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxxf86vm' 'irrlicht' 'sqlite' 'libvorbis' 'openal' 'glu' 'libsm' 'hicolor-icon-theme' 'freetype2')
makedepends=('cmake' 'gettext')
replaces=('minetest-classic')
provides=('minetest-classic' 'voxelands')
conflicts=('minetest-classic' 'minetest-classic-next-git' 'voxelands-next-git')
install="${pkgname}.install"

source=("http://voxelands.com/downloads/${pkgname}-${pkgver}-src.tar.bz2")

sha256sums=('4240d82cc76a39f8524e1a64c3f5dd701ff3f5d62b33e4e773f03f3bb35727de')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_FLAGS_RELEASE=-DNDEBUG -DCMAKE_CXX_FLAGS_RELEASE=-DNDEBUG	
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
