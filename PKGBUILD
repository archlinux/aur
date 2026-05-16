# Maintainer: Charlie <c44014189@gmail.com>

_modname=boongui
pkgname=0ad-${_modname}
pkgver=2.6.11
pkgrel=2
pkgdesc="User interface mod for the RTS game 0 A.D."
arch=('any')
url="https://github.com/LangLangBart/boonGUI"
license=('MIT' 'custom:CCPL')
makedepends=('libarchive')
source=("${url}/releases/download/v${pkgver}/${_modname}.pyromod")
noextract=("${_modname}.pyromod")
sha256sums=('8a368d90a222013c04ef7b9e0264ceb1d1c33bf3ced0d18b04f522e88251fa68')

package() {
  install -Dm644 "${srcdir}/${_modname}.pyromod" -t "${pkgdir}/usr/share/0ad/data/mods/${_modname}"
  
  # Extract mod metadata to let 0 A.D. identify the mod
  cd "${pkgdir}/usr/share/0ad/data/mods/${_modname}"
  bsdunzip -o "${_modname}.pyromod" "mod.json"
}
