# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=kodi-addon-jellyfin
pkgver=1.1.0
pkgrel=1
pkgdesc='Synchronize your media on your Jellyfin server to the native Kodi database.'
url='https://github.com/jellyfin/jellyfin-kodi'
license=('GPL-2.0-only')
depends=('kodi' 'python-kodi_six' 'python-dateutil' 'python-requests' 'python-six' 'python-websocket-client')
groups=('kodi-addons')
makedepends=('unzip' 'python-yaml')
arch=('any')
sha256sums=('e9584703ed48182089723382ca1a3ffc41478812afdd36adafbf41256a54c0d2')
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v${pkgver}.tar.gz")

_srcdir="jellyfin-kodi-${pkgver}"

build() {
	cd "${_srcdir}"
	./build.py --version 'py3'
}

package() {
	cd "${_srcdir}"
	install -dm755 "${pkgdir}/usr/share/kodi/addons"
	unzip 'plugin.video.jellyfin+py3.zip' -d "${pkgdir}/usr/share/kodi/addons"
}
