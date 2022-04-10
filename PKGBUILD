# Maintainer: Andy Alt <arch_stanton5995 at protonmail dot com>

_modname=community-maps-2
pkgname=0ad-${_modname}
pkgver=0.25.15
pkgrel=1
pkgdesc="Mod that provides maps made by players and fans of 0ad and shared in the WFG forum"
arch=('any')
url="https://github.com/0ad-matters/community-maps-2"
license=('GPL2')
makedepends=('unzip')
#depends=('0ad')
source=("https://github.com/0ad-matters/${_modname}/releases/download/v${pkgver}/${_modname}-${pkgver}.pyromod")
noextract=("${source[@]##*/}")
sha256sums=('363a191b87c70817801f78931cc1cb9e6d4ec62834b59f70c4147ca21e980fa9')

package() {
  cd "${srcdir}"
  mv "${source[@]##*/}" "${_modname}.zip"
  install -Dm644 "${_modname}.zip" -t "${pkgdir}/usr/share/0ad/data/mods/${_modname}"
  cd "${pkgdir}/usr/share/0ad/data/mods/${_modname}"
  unzip "${_modname}.zip" mod.json
}

