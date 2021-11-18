# Maintainer: Andy Alt <andy400-dev at yahoo dot com>

_modname=boongui
pkgname=0ad-${_modname}
pkgver=1.7
pkgrel=1
pkgdesc="User interface mod for the RTS game 0 A.D."
arch=('any')
url="https://github.com/LangLangBart/boonGUI"
license=('GPL2')
makedepends=('unzip')
#depends=('0ad')
source=("https://wildfiregames.com/forum/applications/core/interface/file/attachment.php?id=58107&key=24460c0ed73c061552e2f5af99777e5b")
noextract=("${source[@]##*/}")
sha256sums=('656affe62e7f32a64ff469301bc9386b40dd0e27a468d82bd3c61bdf9a4d0062')

package() {
  cd "${srcdir}"
  mv "${source[@]##*/}" "${_modname}.zip"
  install -Dm644 "${_modname}.zip" -t "${pkgdir}/usr/share/0ad/data/mods/${_modname}"
  cd "${pkgdir}/usr/share/0ad/data/mods/${_modname}"
  unzip "${_modname}.zip" mod.json
}

