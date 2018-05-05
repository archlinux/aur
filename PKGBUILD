# Maintainer: rubenwardy <rw@rubenwardy.com>

pkgname=nodeboxeditor
_pkgname=NodeBoxEditor
pkgver=0.9.2
pkgrel=1
pkgdesc='3D Cuboid Voxel Editor for Minetest'
url='https://rubenwardy.com/NodeBoxEditor'
license=('GPL3')
arch=('i686' 'x86_64')
makedepends=('git' 'cmake')
depends=('irrlicht' 'libjpeg' 'libpng' 'mesa' 'zenity')
source=("git://github.com/rubenwardy/NodeBoxEditor.git#tag=v${pkgver}")
sha256sums=('SKIP')
install=install

prepare() {
	cd "${srcdir}"
}

build() {
	cd "${srcdir}/NodeBoxEditor"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	make -j3
}

package() {
	cd "${srcdir}/NodeBoxEditor"
	make DESTDIR="${pkgdir}" install
}
