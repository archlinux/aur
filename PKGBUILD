# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=jellycon
pkgname=kodi-addon-${_pkgname}
pkgver=1.0.2
pkgrel=1
pkgdesc='Lightweight Kodi add-on that lets you browse and play media files directly from your Jellyfin server.'
url="https://github.com/jellyfin/${_pkgname}"
license=('GPL-2.0-only')
depends=('kodi' 'python-kodi_six' 'python-dateutil' 'python-requests' 'python-six' 'python-websocket-client')
groups=('kodi-addons')
makedepends=('unzip' 'python-yaml')
arch=('any')
sha256sums=('4053cb40c0ea25bab3cf13e128a70e1a2101e23213aa9b14bf5fa6ddcb046394')
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
