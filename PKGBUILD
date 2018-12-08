# Maintainer: Kamil Śliwak <cameel2@gmail.com>

_addon_name=firefox_multi_account_containers
_addon_version=6.0.1
_addon_id=782160
_addon_filename="${_addon_name}-${_addon_version}-fx.xpi"
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
sha256sums=('3a7137d67c9f2d6ae675691e20bbdea8298275e59b3214d1c46144621a08f4d1')

package() {
    cd "${srcdir}"
    install -Dm644 "${_addon_filename}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
