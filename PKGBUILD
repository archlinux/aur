# Maintainer: Christoph Brill <aur@christophbrill.de>

pkgname=blender-plugin-ucupaint
pkgver=2.4.9
pkgrel=1
pkgdesc='Blender addon to manage texture layers for Eevee and Cycles renderer'
arch=('any')
url='https://extensions.blender.org/add-ons/ucupaint/'
license=('GPL-3.0-only')
depends=('blender')
source=("https://github.com/ucupumar/ucupaint/releases/download/${pkgver}/ucupaint-no-auto-update-${pkgver}.zip")
sha256sums=('82ec6c77d32681148f605e442ead685ad5e7aa92ca473246bd63b98ed8cc0803')

package() {
    _blenderver=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]+\.[[:digit:]]+(?=\.)')
    _dest="${pkgdir}/usr/share/blender/${_blenderver}/extensions/system"
    install -d "${_dest}"
    cp -r -t "${_dest}" ucupaint
}
