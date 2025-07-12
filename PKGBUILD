# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=librewolf-extension-dark-background-light-text
_id="jid1-QoFqdK4qzUfGWQ@jetpack"
pkgver=0.7.6
pkgrel=1
pkgdesc="Make every web page (or just the pages you want) display light text on dark backgrounds"
arch=('any')
url="https://github.com/m-khvoinitsky/dark-background-light-text-extension"
license=('MPL-2.0')
depends=('librewolf')
checkdepends=('jq')
groups=('librewolf-addons')
source=("${_id}.xpi::https://addons.mozilla.org/firefox/downloads/file/3722915/dark_background_light_text-${pkgver}.xpi")
noextract=("${_id}.xpi")
sha256sums=('1821db8eb7fb7910ca3e2ef7da283a2300e05a398c0e8c58763e0226da7dcd5b')
b2sums=('60144d2b58b903736e18fad561f8f592908245b782abfad97edfebfcfad8495f9622f3d2763081bb45e240f1c1f74f5f4702ed14d753d7220802ce8dedb1a86d')
check() {
  bsdtar xf ${_id}.xpi manifest.json
  jq '.version' manifest.json | grep -E '^"'$pkgver'"$'
}
package() {
  _dest="${pkgdir}/usr/lib/librewolf/browser/extensions/${_id}.xpi"
  install -Dm644 ${_id}.xpi "${_dest}"
}
