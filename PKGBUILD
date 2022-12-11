# Maintainer: Kamil Śliwak <cameel2@gmail.com>

_addon_name=yomichan
_addon_version=22.10.23.0
_file_id=4026607
_gecko_id="alex@foosoft.net"

pkgname="firefox-extension-${_addon_name}"
pkgver="${_addon_version}"
pkgrel=1
pkgdesc="Firefox extension that provides a Japanese dictionary with Anki integration"
arch=('any')
url="https://foosoft.net/projects/yomichan/"
license=('GPL3')
depends=("firefox")
source=("yomichan.xpi::https://addons.mozilla.org/firefox/downloads/file/${_file_id}")
noextract=(yomichan.xpi)
sha256sums=('d8a6118d3a55bdb24886b9e33c6d44742143574c4f678ca97ab118ec79701a1b')

package() {
    cd "${srcdir}"
    install -Dm644 yomichan.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
