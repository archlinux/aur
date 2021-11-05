# Maintainer: Andy Alt <andy400-dev at yahoo dot com>

_modname=community-maps-2
pkgname=0ad-${_modname}
pkgver=0.25.8
pkgrel=1
pkgdesc="mod that provides maps made by players and fans of 0ad and shared in the WFG forum"
arch=('any')
url="https://github.com/0ad-matters/community-maps-2"
license=('GPL2')
makedepends=('zip')
#depends=('0ad')
source=("https://github.com/0ad-matters/${_modname}/releases/download/v${pkgver}/${_modname}-${pkgver}.pyromod")
noextract=('${_modname}-${pkgver}.pyromod')
sha256sums=('62bcff7deb1aefbe782e14903178759dca44862d0c0e6035cb9f0eb8564152b1')

package() {
  cd "${srcdir}"
  zip -r "${_modname}.zip" art gui simulation maps
  install -Dm644 "${_modname}.zip" -t "${pkgdir}/usr/share/0ad/data/mods/${_modname}"
  cp mod.json -t "${pkgdir}/usr/share/0ad/data/mods/${_modname}"
  cp credits.txt -t "${pkgdir}/usr/share/0ad/data/mods/${_modname}"
  cp ChangeLog -t "${pkgdir}/usr/share/0ad/data/mods/${_modname}"
  cp readme.md -t "${pkgdir}/usr/share/0ad/data/mods/${_modname}"
}

