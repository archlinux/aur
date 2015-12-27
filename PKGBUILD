# Maintainer: nic96 <jeromyreimer at gmail dot com>

pkgname=voxelands-bin
pkgver=1512.00
pkgrel=1
pkgdesc="A fork of Minetest, an Infiniminer/Minecraft inspired game"
arch=(x86_64)
url="http://www.voxelands.com/"
license=('GPL3')
depends=('libxxf86vm' 'irrlicht' 'sqlite' 'libvorbis' 'openal' 'glu' 'libsm' 'hicolor-icon-theme' 'freetype2' 'libpng12')
replaces=('minetest-classic')
provides=('minetest-classic' 'voxelands')
conflicts=('minetest-classic' 'minetest-classic-next-git' 'voxelands-next-git' 'voxelands')
source=("http://www.voxelands.com/downloads/voxelands-${pkgver}-ubuntu-x86_64.deb")
md5sums=('952a38512de677934b45a8cd55a76153')

build() {
    cd ${srcdir}
    mkdir -p "${srcdir}/${pkgname}"
    tar -zxf data.tar.gz -C "${srcdir}/${pkgname}"
    mv -n ${srcdir}/${pkgname}/usr/local/* ${srcdir}/${pkgname}/usr/
    rm -r "${srcdir}/${pkgname}/usr/local/"
}

package() {
    cd ${srcdir}
    cp -r ${srcdir}/${pkgname}/* "${pkgdir}"
}
