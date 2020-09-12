# Maintainer: Kamil Śliwak <cameel2@gmail.com>

_addon_name=yomichan
_addon_version=20.8.24.0
_addon_id=789636
_addon_filename="${_addon_name}-${_addon_version}-an+fx.xpi"
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
sha256sums=('8aa43f3661bfa6c500a91d69f9e58cf82e1d782cf4b692699a8bef6881a36053')

package() {
    cd "${srcdir}"
    install -Dm644 "${_addon_filename}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
