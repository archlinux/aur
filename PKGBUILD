# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-system-monitor
pkgver=6.8.0
pkgrel=1
pkgdesc='An interface for monitoring system sensors, process information and other system resources'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-system-monitor'
license=(
	'GPL-2.0-or-later'
	'LGPL-2.0-or-later'
)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'sonic-frameworks-addons-downloader'
	'sonic-frameworks-app-info'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-data-models'
	'sonic-frameworks-dbus'
	'sonic-frameworks-icon-themes'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-keybind'
	'sonic-frameworks-qml-bridge'
	'sonic-frameworks-quick-charts'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-quick-ui-addons'
	'sonic-frameworks-settings'
	'sonic-frameworks-windowsystem'
	'sonic-system-monitor-library'
	'sonic-system-stats'
)
makedepends=('sonic-frameworks-cmake-modules')
provides=('plasma-systemmonitor')
conflicts=('plasma-systemmonitor')
replaces=('ksysguard')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c5871c654cedf848dd2f625d5b885805fc67c59ec21d7d8736a255ef1a18e921')

build() {
	cmake -B build -S "$pkgname-$pkgver"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
