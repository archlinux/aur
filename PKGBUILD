# Maintainer: Christoph Brill <aur@christophbrill.de>

pkgname=blender-plugin-ucupaint
pkgver=3.0.2
pkgrel=1
pkgdesc='Blender addon to manage texture layers for Eevee and Cycles renderer'
arch=('any')
url='https://extensions.blender.org/add-ons/ucupaint/'
license=('GPL-3.0-only')
depends=('blender')
source=("https://github.com/ucupumar/ucupaint/releases/download/${pkgver}/ucupaint-no-auto-update-${pkgver}.zip")
sha256sums=('0f3d42b857c364a9d5559b9a3a9dc7b371cb11db9ef141ba3fabf957d9c68eb2')

package() {
    _blenderver=$(pacman -Sddp --print-format %v blender|grep -oP '(?<=\:)[[:digit:]]+\.[[:digit:]]+(?=\.)')
    _dest="${pkgdir}/usr/share/blender/${_blenderver}/extensions/system"
    install -d "${_dest}"
    cp -r -t "${_dest}" ucupaint
}
