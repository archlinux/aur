# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=chromium-pepper-flash
pkgdesc="Google Chrome's Pepper Flash plugin for Chromium (stable version)"
_verbld=47.0.2526.80-1
pkgver=20.0.0.228
pkgrel=1
epoch=1
arch=('i686' 'x86_64')
url="http://www.google.com/chrome"
license=('custom:chrome')
conflicts=('chromium-pepper-flash-dev')
provides=('pepper-flash')
source=(${pkgname}-license.html::https://www.google.com/chrome/intl/en/eula_text.html)
source_i686=("https://dl.google.com/linux/chrome/rpm/stable/i386/google-chrome-stable-${_verbld}.i386.rpm")
source_x86_64=(https://dl.google.com/linux/chrome/rpm/stable/x86_64/google-chrome-stable-${_verbld}.x86_64.rpm)
sha256sums=('b35811bb330576631e64f7885c66720e0be4ca81afb04328b3a0f288a708e37f')
sha256sums_i686=('ed0ad36f1ee1df457c929bb0740ab77ba2b77e2ccf4b190cf42f5f98460d8ac2')
sha256sums_x86_64=('416563ca102daf61f54b4ff0e5418b1e558bf45cc662d8c1588646665443629d')

package() {
	# create required directories
	install -d "${pkgdir}"/usr/lib/PepperFlash
	# copy required files
	install -m644 "${srcdir}"/opt/google/chrome/PepperFlash/* "${pkgdir}"/usr/lib/PepperFlash
	# copy license
	install -Dm644 "${srcdir}"/${pkgname}-license.html "${pkgdir}"/usr/share/licenses/${pkgname}/license.html
}
