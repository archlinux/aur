# Maintainer: Andy Alt <andy400-dev@yahoo.com>
# Maintainer: Ilan Frumer <ilanfrumer@gmail.com>

_modname=boongui
pkgname=0ad-${_modname}
pkgver=2.6.11
pkgrel=1
pkgdesc="User interface mod for the RTS game 0 A.D."
arch=('any')
url="https://github.com/LangLangBart/boonGUI"
license=('MIT', 'CCPL')
makedepends=('libarchive')
#depends=('0ad')
source=("${url}/releases/latest/download/${_modname}.pyromod")
noextract=("${_modname}.pyromod")
sha256sums=('8a368d90a222013c04ef7b9e0264ceb1d1c33bf3ced0d18b04f522e88251fa68')

package() {
  cd "${srcdir}"
  install -Dm644 "${_modname}.pyromod" -t "${pkgdir}/usr/share/0ad/data/mods/${_modname}"
  cd "${pkgdir}/usr/share/0ad/data/mods/${_modname}"
  bsdunzip -o "${_modname}.pyromod" "mod.json"
}
