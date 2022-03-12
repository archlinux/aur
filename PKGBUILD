# Maintainer: Andy Alt <andy400-dev at yahoo dot com>

_modname=community-maps-2
pkgname=0ad-${_modname}
pkgver=0.25.13
pkgrel=1
pkgdesc="Mod that provides maps made by players and fans of 0ad and shared in the WFG forum"
arch=('any')
url="https://github.com/0ad-matters/community-maps-2"
license=('GPL2')
makedepends=('unzip')
#depends=('0ad')
source=("https://github.com/0ad-matters/${_modname}/releases/download/v${pkgver}/${_modname}-${pkgver}.pyromod")
noextract=("${source[@]##*/}")
sha256sums=('6d5d73137b058c1fbc2b2e8d3a20c75233dcd03d83252e6fa4b7cf7b0bf622a4')

package() {
  cd "${srcdir}"
  mv "${source[@]##*/}" "${_modname}.zip"
  install -Dm644 "${_modname}.zip" -t "${pkgdir}/usr/share/0ad/data/mods/${_modname}"
  cd "${pkgdir}/usr/share/0ad/data/mods/${_modname}"
  unzip "${_modname}.zip" mod.json
}

