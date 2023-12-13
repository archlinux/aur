# Maintainer: jmcb <joelsgp@protonmail.com>

pkgname='blender-plugin-sketchfab'
pkgver='1.6.0'
# replace . with -
_name="sketchfab-plugin-${pkgver//./-}"
_blenderver='4.0'
pkgrel=1
pkgdesc="Directly import and export models from and to Sketchfab in Blender"
arch=('any')
url="https://github.com/sketchfab/blender-plugin"
license=('Apache')
depends=('blender')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("https://github.com/sketchfab/blender-plugin/releases/download/${pkgver}/${_name}.zip")
sha256sums=('79c9290c608308c27507d7bd5f96f8d7c9bbf5ce8f3ce73ec1793dd6661f36f7')


package() {
    # todo get blenderver from blender --version
    _dest="${pkgdir}/usr/share/blender/${_blenderver}/scripts/addons"
    install -d "${_dest}"
    bsdtar --cd "${_dest}" -xf "${_name}.zip"
}
