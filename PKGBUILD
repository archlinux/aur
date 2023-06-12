# Maintainer: jmcb <joelsgp@protonmail.com>

pkgname='blender-plugin-sketchfab'
pkgver='1.5.0'
# replace . with -
_name="sketchfab-plugin-${pkgver//./-}"
_blenderver='3.5'
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
sha256sums=('2af10639ec07177e8494d492200caf254cb43c4572519ce55f705e348b50cf4b')


package() {
    _dest="${pkgdir}/usr/share/blender/${_blenderver}/scripts/addons"
    install -d "${_dest}"
    bsdtar --cd "${_dest}" -xf "${_name}.zip"
}
