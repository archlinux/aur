# Maintainer: Kamil Śliwak <cameel2@gmail.com>

_addon_name=yomichan
_addon_version=21.7.31.2
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
sha256sums=('85f0b082f648e7c750c57d2c52b139f96917a1b4be7881d836a9ff75fa163828')

package() {
    cd "${srcdir}"
    install -Dm644 "${_addon_filename}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
