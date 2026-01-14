# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=librewolf-extension-duckduckgo-privacy-essentials
_id="jid1-ZAdIEUB7XOzOJw@jetpack"
pkgver=2026.1.12
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
sha256sums=('e04d67abe61c154eb0119e7b746c9671f71ad6978c3e5526cba8444de5bb41e7')
b2sums=('a4c8c9cfd3267ec80489ef059b3e6f5b1d20b4bb5fb2bcae1f765dff27a495ec5ab874e3c94c98236b0ad777ce2d9c7be85fb7b91f4e5b4aedb3fbd56feeb528')

check() {
  bsdtar xOf ${_id}.xpi manifest.json|jq --arg v ${pkgver} -e '.version==$v'
}

package() {
  _dest="${pkgdir}/usr/lib/librewolf/browser/extensions/${_id}.xpi"
  install -Dm644 ${_id}.xpi "${_dest}"
}
