# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=kodi-addon-jellyfin
pkgver=0.7.12
pkgrel=1
pkgdesc='Synchronize your media on your Jellyfin server to the native Kodi database.'
url='https://github.com/jellyfin/jellyfin-kodi'
license=('GPL3')
depends=('kodi' 'python-kodi_six' 'python-dateutil' 'python-requests' 'python-six' 'python-websocket-client')
groups=('kodi-addons')
makedepends=('unzip' 'python-yaml')
arch=('any')
sha256sums=('6b2b215b89f0228e733c86e7e5c2b73ea23aea43df2ccd694b811f5f2647f614')
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
