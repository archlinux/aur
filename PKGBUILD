# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=zoom
pkgver=2.0.75971.1216
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
sha512sums_i686=('dbbaa1f4d7299a29b1cf96d2304fa39f12a6754b9199d63de913f8bb636786ea9caac0cabdcc2ccc26532bc9bb76fe1962db0a79a22f88aa8e37cfdfe7476ca8')
sha512sums_x86_64=('fc9bc6f9e95a559045c2c5f3f5bb6e78f65243368e9438d391405de1e03cbcc89faa1033a7a4a9bb221113141d997743e2788af194f0e79c6cdbfe4d8d7cbd61')

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
