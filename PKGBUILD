# Maintainer: Andy Alt <andy400-dev at yahoo dot com>
# Maintainer: Ilan Frumer <ilanfrumer at gmail dot com>

_modname=boongui
pkgname=0ad-${_modname}
pkgver=2.0.0
pkgrel=1
pkgdesc="User interface mod for the RTS game 0 A.D."
arch=('any')
url="https://github.com/LangLangBart/boonGUI"
license=('MIT', 'CCPL')
makedepends=('unzip')
#depends=('0ad')
source=("https://github.com/LangLangBart/boonGUI/releases/download/v${pkgver}/${_modname}.pyromod")
noextract=("${source[@]##*/}")
sha256sums=('f46c9ecb96ea555a45512cbd470b69849284d1afc7937a2c7cd25ee4622711b4')

package() {
  cd "${srcdir}"
  mv "${source[@]##*/}" "${_modname}.zip"
  unzip "${_modname}.zip" "ARTWORK_and _LICENSE.txt"
  install -Dm644 "ARTWORK_and _LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "${_modname}.zip" -t "${pkgdir}/usr/share/0ad/data/mods/${_modname}"
  cd "${pkgdir}/usr/share/0ad/data/mods/${_modname}"
  unzip "${_modname}.zip" mod.json
}

