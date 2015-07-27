# Maintainer: Nascher <kevin at roschan dot de>
# Contributor: Menche <menche_mt at yahoo dot com>

pkgname=voxelands
pkgver=1507.00
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

sha256sums=('f73e79928718a2ca3136d8b6b0305202774763069c8600b211755b3608453c71')

build() {
	cd "${srcdir}/${pkgname}"

	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_FLAGS_RELEASE=-DNDEBUG -DCMAKE_CXX_FLAGS_RELEASE=-DNDEBUG	
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}
