# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=librewolf-extension-duckduckgo-privacy-essentials
_id="jid1-ZAdIEUB7XOzOJw@jetpack"
pkgver=2025.7.23
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
sha256sums=('a3740b95e41677a05a72448358142863d7f4ac2ea2174682e57910b59d320daf')
b2sums=('d15226774cf2ace34af291a0d2c9e34f8024104fb2ca5a0567c2de4418bf826b9417a27ec339faaf60a5d802bdcddfa9ee6b7e3abd3a30cabaaac99eea979b52')

check() {
  bsdtar xOf ${_id}.xpi manifest.json|jq --arg v ${pkgver} -e '.version==$v'
}

package() {
  _dest="${pkgdir}/usr/lib/librewolf/browser/extensions/${_id}.xpi"
  install -Dm644 ${_id}.xpi "${_dest}"
}
