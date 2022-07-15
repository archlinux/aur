# Maintainer: nic96 <jeromyreimer at gmail dot com>
# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=voxelands-bin
pkgver=1602.00
pkgrel=3
pkgdesc="A fork of Minetest, an Infiniminer/Minecraft inspired game"
arch=(x86_64)
url="https://web.archive.org/web/20180616063819/voxelands.com/"
license=('GPL3')
depends=('libxxf86vm' 'irrlicht' 'sqlite' 'libvorbis' 'openal' 'glu' 'libsm' 'hicolor-icon-theme' 'freetype2' 'libpng12')
replaces=('minetest-classic')
provides=('minetest-classic' 'voxelands')
conflicts=('minetest-classic' 'minetest-classic-next-git' 'voxelands-next-git' 'voxelands')
source=("https://github.com/bl00dy1837/voxelands_deb/blob/main/voxelands-1602.00-ubuntu-x86_64.deb?raw=true")
md5sums=('977894fa4216fa8acfe235cfaa315419')

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
