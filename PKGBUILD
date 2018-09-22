# Maintainer: Kamil Śliwak <cameel2@gmail.com>

_addon_name=smart_referer
_addon_version=0.2.10
_addon_id=327417
_addon_filename="${_addon_name}-${_addon_version}-an+fx.xpi"
_gecko_id="smart-referer@meh.paranoid.pk"

pkgname=firefox-extension-smart-referer
pkgver=${_addon_version}
pkgrel=1
pkgdesc="Browser extension that automatically hides the referer when changing domains"
arch=('any')
url="https://github.com/meh/smart-referer"
license=('WTFPL')
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/${_addon_id}/${_addon_filename}")
noextract=("${_addon_filename}")
sha256sums=('7ab790b03620c76b65f501ca0005657f14f06129181a1446e0aa4e13a533b891')

package() {
    cd "${srcdir}"
    install -Dm644 "${_addon_filename}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
