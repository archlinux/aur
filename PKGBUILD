# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Edited from: firefox-extension-https-everywhere

_pkgname=EnhancedSteam
pkgname=firefox-extension-enhancedsteam
pkgver=9.1.1
pkgrel=1
pkgdesc="Plugin for firefox that enhances the steam website and adds new functionality."
license=('GPL2')
arch=('any')
url="https://enhancedsteam.com/"
depends=("firefox")
makedepends=("unzip")
source=("https://firefox.enhancedsteam.com/${_pkgname}.xpi")
noextract=("${_pkgname}.xpi")
sha256sums=('e5f0988a8ddf0f6b82954f77fef2d9a442bbfecc953aaafab63f2f5b69e3eef1')

prepare() {
	cd "$srcdir"

	unzip -qqo "${_pkgname}.xpi" -d "${_pkgname}"
}

package() {
	cd "${srcdir}"

	_extension_id="jid1-YdiFiTEkQgInxA@jetpack"
	_extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
	install -Dm644 ${_pkgname}.xpi "${_extension_dest}.xpi"
}
