# Maintainer: Kamil Śliwak <cameel2@gmail.com>

_addon_name=firefox_multi_account_containers
_addon_version=6.0.0
_addon_id=782160
_addon_filename="${_addon_name}-${_addon_version}-an+fx-linux.xpi"
_gecko_id="@testpilot-containers"

pkgname=firefox-extension-multi-account-containers
pkgver=${_addon_version}
pkgrel=1
pkgdesc="Browser extension that separates website storage into tab-specific Containers"
arch=('any')
url="https://github.com/mozilla/multi-account-containers"
license=('MPL2')
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/${_addon_id}/${_addon_filename}")
noextract=("${_addon_filename}")
sha256sums=('229efbbfbb2d1894c6f09b6a86939226021e82cff8759229e42263b42a635dbe')

package() {
    cd "${srcdir}"
    install -Dm644 "${_addon_filename}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
