# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Edited from: firefox-extension-https-everywhere

_pkgname=EnhancedSteam
pkgname=firefox-extension-enhancedsteam
pkgver=9.8.1
pkgrel=1
pkgdesc="Plugin for firefox that enhances the steam website and adds new functionality."
license=('GPL2')
arch=('any')
url="https://enhancedsteam.com/"
depends=("firefox")
makedepends=("unzip")
source=("${_pkgname}.xpi::https://addons.mozilla.org/firefox/downloads/file/907319/enhanced_steam-${pkgver}-an+fx.xpi?src=version-history")
noextract=("${_pkgname}.xpi")
sha256sums=('ba8a89c1113c9de96998cbbea5283c90c76dc3b8279b02bbc718c38b6a5ff73a')

package() {
	cd "${srcdir}"

	_extension_id="jid1-YdiFiTEkQgInxA@jetpack"
	_extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
	install -Dm644 ${_pkgname}.xpi "${_extension_dest}.xpi"
}
