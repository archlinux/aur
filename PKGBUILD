# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux,org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=sonic-ecco
pkgver=26.08.2
pkgrel=1
pkgdesc='SonicDE File Manager'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-ecco'
license=('LGPL-2.0-or-later')
depends=(
	'baloo-widgets'
	'glibc'
	'libstdc++'
	'qt6-base'
	'qt6-multimedia'
	'sonic-frameworks-addons-downloader'
	'sonic-frameworks-app-info'
	'sonic-frameworks-autocomplete'
	'sonic-frameworks-bookmarks'
	'sonic-frameworks-color-scheme'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-dbus'
	'sonic-frameworks-device-integration'
	'sonic-frameworks-file-metadata'
	'sonic-frameworks-file-search'
	'sonic-frameworks-gui-addons'
	'sonic-frameworks-icon-themes'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-io-extras'
	'sonic-frameworks-notifications'
	'sonic-frameworks-progress-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-ui'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-text-codec'
	'sonic-frameworks-text-widgets'
	'sonic-frameworks-ui-components'
	'sonic-frameworks-user-feedback'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-windowsystem'
	'sonic-frameworks-xml-gui'
)
makedepends=(
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
optdepends=(
	'dolphin-plugins: extra plugins'
	'ffmpegthumbs: video thumbnails'
	'filelight: detailed disk usage statistics'
	'kdegraphics-thumbnailers: PDF and PS thumbnails'
	'kdenetwork-filesharing: samba usershare properties menu'
	'kdf: view disk usage'
	'kio-admin: for managing files as administrator'
	'kompare: comparing files menu action'
	'sonic-frameworks-purpose: share context menu'
	'sonic-terminal-tools: for editing file type options'
	'sonic-terminal: terminal panel'
)
provides=('dolphin')
conflicts=('dolphin')
groups=(
	'sonicde-applications'
	'sonicde-system'
)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1829f62dfdd57b55c6b1ecb9a0278f0a61fb77748582f317009d39e0125c201d')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
