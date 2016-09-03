# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=chromium-pepper-flash
pkgdesc="Google Chrome's Pepper Flash plugin for Chromium (stable version)"
_verbld=53.0.2785.92-1
pkgver=22.0.0.209
pkgrel=1
epoch=1
arch=('x86_64')
url="http://www.google.com/chrome"
license=('custom:chrome')
depends=('gcc-libs')
conflicts=('chromium-pepper-flash-dev' 'pepper-flash' 'adobe-flashplugin')
provides=('pepper-flash')
source=(${pkgname}-license.html::https://www.google.com/intl/en/chrome/browser/privacy/eula_text.html
	    https://dl.google.com/linux/chrome/rpm/stable/x86_64/google-chrome-stable-${_verbld}.x86_64.rpm)
sha256sums=('e93c01576427cad9099f2cf0df0be70d0a2cc0a3a66c743318b2138aa7c4ed93'
            '0225c85b52e3d86c17f89542ae55eda175cbbe552cb14fe32ddba05a1f6b2891')

package() {
	# create required directories
	install -d "${pkgdir}"/usr/lib/PepperFlash
	# copy required files
	install -m644 "${srcdir}"/opt/google/chrome/PepperFlash/* "${pkgdir}"/usr/lib/PepperFlash
	# copy license
	install -Dm644 "${srcdir}"/${pkgname}-license.html "${pkgdir}"/usr/share/licenses/${pkgname}/license.html
}
