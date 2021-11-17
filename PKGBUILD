# Maintainer: Andy Alt <andy400-dev at yahoo dot com>

_modname="0ad_Delenda_Est_A25"
pkgname="0ad-delenda-est"
pkgver=0.25.0
pkgrel=1
pkgdesc="A complete overhaul mod for 0 A.D. Empires Ascendant. New factions. New technology trees. New units. New graphics. New features. New balance. New experience."
arch=('any')
url="https://github.com/JustusAvramenko/delenda_est"
license=('unknown')
makedepends=('unzip')
#depends=('0ad')
source=("https://binary.lge.modcdn.io/mods/698d/111/0ad_delenda_est_a25.zip")
noextract=("${source[@]##*/}")
sha256sums=('1fe55b05dae4d2910060019398c5e3a0738c87b7e4ba63fa449e7376ae03302d')

package() {
  cd "${srcdir}"
  mv "${source[@]##*/}" "${_modname}.zip"
  install -Dm644 "${_modname}.zip" -t "${pkgdir}/usr/share/0ad/data/mods/${_modname}"
  cd "${pkgdir}/usr/share/0ad/data/mods/${_modname}"
  unzip "${_modname}.zip" mod.json
}

