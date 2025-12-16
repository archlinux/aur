# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=librewolf-extension-duckduckgo-privacy-essentials
_id="jid1-ZAdIEUB7XOzOJw@jetpack"
pkgver=2025.12.14
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
sha256sums=('30a757523e81d553b7225d61f1e7307042f2ac2b2647fab62851e1d44e5cf19f')
b2sums=('10f88a226b35140fcb05e4f8ddebcebd511b8b5aad3f9fdb7b5282bea5b1f5b6b726f04f867a8360a3ff2692d4d23259e68b7403c477773f5070ac48e2249242')

check() {
  bsdtar xOf ${_id}.xpi manifest.json|jq --arg v ${pkgver} -e '.version==$v'
}

package() {
  _dest="${pkgdir}/usr/lib/librewolf/browser/extensions/${_id}.xpi"
  install -Dm644 ${_id}.xpi "${_dest}"
}
