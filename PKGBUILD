# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=jellycon
pkgname=kodi-addon-${_pkgname}
pkgver=0.8.1
pkgrel=1
pkgdesc='Lightweight Kodi add-on that lets you browse and play media files directly from your Jellyfin server.'
url="https://github.com/jellyfin/${_pkgname}"
license=('GPL2')
depends=('kodi' 'python-kodi_six' 'python-dateutil' 'python-requests' 'python-six' 'python-websocket-client')
groups=('kodi-addons')
makedepends=('unzip' 'python-yaml')
arch=('any')
sha256sums=('803367ee2bb4a5a4e9b32aa85940a1a962b63efbc43e2ddc9ef10a103fec8f53')
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v${pkgver}.tar.gz")

_srcdir="${_pkgname}-${pkgver}"

build() {
	cd "${_srcdir}"
	./build.py --version 'py3'
}

package() {
	cd "${_srcdir}"
	install -dm755 "${pkgdir}/usr/share/kodi/addons"
	unzip 'plugin.video.jellycon+py3.zip' -d "${pkgdir}/usr/share/kodi/addons"
}
