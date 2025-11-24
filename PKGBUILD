# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=librewolf-extension-duckduckgo-privacy-essentials
_id="jid1-ZAdIEUB7XOzOJw@jetpack"
pkgver=2025.11.3
pkgrel=1
pkgdesc="Actively protects your data in your current browser"
arch=('any')
url="https://duckduckgo.com/duckduckgo-help-pages/desktop/firefox"
license=('MPL-2.0')
depends=('librewolf')
checkdepends=('jq')
groups=('librewolf-addons')
source=("${_id}.xpi::https://github.com/duckduckgo/duckduckgo-privacy-extension/releases/download/${pkgver}/duckduckgo_privacy_essentials-${pkgver}.zip")
noextract=("${_id}.xpi")
sha256sums=('0f7a28fd24dac4857fb00865fecd065483b266a6adaa8446aaa42690db36491f')
b2sums=('7550b3be6aa8998dcd8e390a56415cc3dffb2d387d2b9ae7352fa4c913e749e0fbccd85f4bc36a4e1813bbce1262c9bb4d7853d0d1a65be8e4352d67b9a10564')

check() {
  bsdtar xOf ${_id}.xpi manifest.json|jq --arg v ${pkgver} -e '.version==$v'
}

package() {
  _dest="${pkgdir}/usr/lib/librewolf/browser/extensions/${_id}.xpi"
  install -Dm644 ${_id}.xpi "${_dest}"
}
