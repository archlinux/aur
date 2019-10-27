# Maintainer: Kamil Śliwak <cameel2@gmail.com>

_addon_name=yomichan
_addon_version=1.8.8
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
sha256sums=('db1b9e3bf1f54e8c622940dc5da430b0fb92696dc399f4eca086f0b1646134ab')

package() {
    cd "${srcdir}"
    install -Dm644 "${_addon_filename}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
