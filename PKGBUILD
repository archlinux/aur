# Maintainer: Kamil Śliwak <cameel2@gmail.com>

_addon_name=yomichan
_addon_version=1.5.1
_addon_id=789636
_addon_filename="${_addon_name}-${_addon_version}-an+fx-linux.xpi"
_gecko_id="alex@foosoft.net"

pkgname=firefox-extension-${_addon_name}
pkgver=${_addon_version}
pkgrel=1
pkgdesc="Firefox extension that provides a Japanese dictionary with Anki integration"
arch=('any')
url="https://foosoft.net/projects/yomichan/"
license=('GPL3')
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/${_addon_id}/${_addon_filename}")
noextract=("${_addon_filename}")
sha256sums=('189dd8a48e02db372936f78325ba3ff6df7737f521e04ca5e5750c8ad1252165')

package() {
    cd "${srcdir}"
    install -Dm644 "${_addon_filename}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
