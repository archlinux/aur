# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=zoom
pkgver=2.0.70790.1031
pkgrel=1
pkgdesc="Video Conferencing and Web Conferencing Service"
arch=('i686' 'x86_64')
license=('custom')
url="https://zoom.us/"
depends=('glib2' 'gstreamer' 'libxcb' 'xcb-util-image' 'fontconfig' 'mesa' 'libxi' 'libsm' 'libxrender'
	'libpulse' 'libxcomposite' 'libxslt' 'sqlite' 'xcb-util-keysyms' 'qt5-webengine' 'gstreamer0.10-base' 'qt5-svg')
options=(!strip)
source_i686=("${pkgname}-${pkgver}_i386.deb"::"https://zoom.us/client/${pkgver}/zoom_i386.deb")
source_x86_64=("${pkgname}-${pkgver}_amd64.deb"::"https://zoom.us/client/${pkgver}/zoom_amd64.deb")
md5sums_i686=('e2049b88e3efdc902170ae1759c38d4a')
md5sums_x86_64=('bbe4ffc5e50d97848ea90fa4f625a5a5')

package() {
	bsdtar xf data.tar.xz
	chmod -R g-w usr
	mv usr "${pkgdir}"
	chmod -R g-w opt
	mv opt "${pkgdir}"

	# Refering to the online license
	mkdir -p "${pkgdir}"/usr/share/licenses/zoom/
	echo "Please refer to https://zoom.us/terms for detailed license information." > "${pkgdir}"/usr/share/licenses/zoom/LICENSE
}
