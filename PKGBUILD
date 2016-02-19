# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=chromium-pepper-flash
pkgdesc="Google Chrome's Pepper Flash plugin for Chromium (stable version)"
_verbld=48.0.2564.116-1
pkgver=20.0.0.306
pkgrel=1
epoch=1
arch=('i686' 'x86_64')
url="http://www.google.com/chrome"
license=('custom:chrome')
depends=('gcc-libs')
conflicts=('chromium-pepper-flash-dev')
provides=('pepper-flash')
source=(${pkgname}-license.html::https://www.google.com/chrome/intl/en/eula_text.html)
source_i686=("https://dl.google.com/linux/chrome/rpm/stable/i386/google-chrome-stable-${_verbld}.i386.rpm")
source_x86_64=(https://dl.google.com/linux/chrome/rpm/stable/x86_64/google-chrome-stable-${_verbld}.x86_64.rpm)
sha256sums=('b35811bb330576631e64f7885c66720e0be4ca81afb04328b3a0f288a708e37f')
sha256sums_i686=('d8eda2556eda46aabbe0cf3e4dd1f197383a83996a1d5d8fab1770bb806af49c')
sha256sums_x86_64=('2a7c84bc487c7a750b8626ff1df98af6389d0f92d8b95852f98b4285f172eeb4')

package() {
	# create required directories
	install -d "${pkgdir}"/usr/lib/PepperFlash
	# copy required files
	install -m644 "${srcdir}"/opt/google/chrome/PepperFlash/* "${pkgdir}"/usr/lib/PepperFlash
	# copy license
	install -Dm644 "${srcdir}"/${pkgname}-license.html "${pkgdir}"/usr/share/licenses/${pkgname}/license.html
}
