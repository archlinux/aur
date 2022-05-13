# Maintainer: Kamil Śliwak <cameel2@gmail.com>

_addon_name=tab_session_manager
_addon_version=6.12.0
_addon_id=3944769
_addon_filename="${_addon_name}-${_addon_version}-fx.xpi"
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
sha256sums=('91daf01ed2f58117ef03b09e24bae388563c329fe87006a2a9bd3d2382b043bf')


package() {
    cd "${srcdir}"
    install -Dm644 "${_addon_filename}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
