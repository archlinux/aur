# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=flutter-engine-google-bin
pkgver=1.0.0
pkgrel=1
epoch=1
pkgdesc='Engine for flutter applications (Binaries from google).'
provides=(flutter-engine)
conflicts=(flutter-engine)
url='https://github.com/flutter/engine'
arch=('x86_64')
license=('BSD')
depends=(
	'cmake'
	'ninja'
	'git'
	'clang'
	'python'
	'unzip'
	'gtk3'
	'yq')
source=(
	'flutter-engine-prepare.sh'
	'flutter-engine-build.sh')
sha256sums=('38aebea0e495017846da5ac09f440fafb74cd7d5b042f6b42038210672a160f4'
            'd5493a84fbac63f741dc561dc681903ece25a2313717989a655b44a52934f314')

package() {
	install -dm755 "${pkgdir}/opt/flutter-engine"
	echo "${pkgver}" > "${pkgdir}/opt/flutter-engine/version"
	
	install -Dm755 'flutter-engine-prepare.sh' "${pkgdir}/opt/flutter-engine/pkgbuild-prepare.sh"
	install -Dm755 'flutter-engine-build.sh' "${pkgdir}/opt/flutter-engine/pkgbuild-build.sh"
}
