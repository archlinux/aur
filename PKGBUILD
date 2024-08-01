# Maintainer: Kamil Śliwak <cameel2@gmail.com>

_addon_name=tab_session_manager
_addon_version=7.0.1
_addon_id=4298614
_addon_filename="${_addon_name}-${_addon_version}.xpi"
_gecko_id="Tab-Session-Manager@sienori"

pkgname=firefox-extension-tab-session-manager
pkgver=${_addon_version}
pkgrel=1
pkgdesc="Firefox extension to save and restore the state of windows and tabs"
arch=('any')
url="https://github.com/sienori/Tab-Session-Manager"
license=('MPL2')
depends=("firefox")
# NOTE: The server ignores file name. Only the addon ID matters (and it's now different for every version).
source=("https://addons.mozilla.org/firefox/downloads/file/${_addon_id}/${_addon_filename}")
noextract=("${_addon_filename}")
sha256sums=('936499a7cf42fabb26a283125cc5ec8c0615407722f3c7e9fb9f6d3ee5916890')


package() {
    cd "${srcdir}"
    install -Dm644 "${_addon_filename}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
