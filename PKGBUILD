# Maintainer: Kamil Śliwak <cameel2@gmail.com>

_addon_name=HideFixedElements
_git_commit=77e9936d338bebf11ec78b8755043d4f18651521
_gecko_id="hidefixedelements@commonground.systems"

pkgname=firefox-extension-hide-fixed-elements
pkgver=1.4
pkgrel=2
pkgdesc="Browser extension to hide position:fixed elements"
arch=(any)
url="https://github.com/andfarm/HideFixedElements"
license=(MIT)
depends=(firefox)
makedepends=(zip)
source=("${_addon_name}-${pkgver}.tar.gz::https://github.com/andfarm/HideFixedElements/archive/${_git_commit}.tar.gz")
sha256sums=(3d8dd98e3c85963a68f3c23bd6607b7c14926e9c14451066dd4fba8c03f64114)


build() {
    cd "${_addon_name}-${_git_commit}/"
    zip "${srcdir}/extension.zip" --filesync --recurse-paths -- *
}

package() {
    install -D --mode 644 "${srcdir}/extension.zip" "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
