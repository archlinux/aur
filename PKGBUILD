# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-theme-sdk
pkgver=6.8.0
pkgrel=2
pkgdesc='Applications useful for SonicDE development'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-theme-sdk'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'qt6-5compat'
	'qt6-base'
	'qt6-declarative'
	'sh'
	'sonic-frameworks-addons-downloader'
	'sonic-frameworks-archive'
	'sonic-frameworks-autocomplete'
	'sonic-frameworks-color-scheme'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-data-models'
	'sonic-frameworks-dbus'
	'sonic-frameworks-icon-themes'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-package'
	'sonic-frameworks-qml-bridge'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-svg'
	'sonic-frameworks-text-editor'
	'sonic-frameworks-widgets-addons'
	'sonic-interface-libraries'
	'sonic-plasma5-support-library'
)
makedepends=(
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
provides=('plasma-sdk')
conflicts=('plasma-sdk')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('27f75234c162dcb75a033adba48a63a16b06056ceb58a0d966b2743805751e30')

build() {
	cmake -B build  -S $pkgname-$pkgver \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
