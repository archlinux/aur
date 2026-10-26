# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-system-settings
pkgver=6.8.0
pkgrel=1
pkgdesc='SonicDE system manager for hardware, software, and workspaces'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-system-settings'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'sonic-activities'
	'sonic-frameworks-app-info'
	'sonic-frameworks-auth'
	'sonic-frameworks-color-scheme'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-data-models'
	'sonic-frameworks-data-views'
	'sonic-frameworks-dbus'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-progress-ui'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-runner'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-ui'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-windowsystem'
	'sonic-frameworks-xml-gui'
)
makedepends=(
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
provides=('systemsettings')
conflicts=('systemsettings')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('10145e708380da7e2f6c3e2b5df988fcc6c288c7dffa6bcd59d8683772d64c44')

build() {
	cmake -B build  -S $pkgname-$pkgver \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
