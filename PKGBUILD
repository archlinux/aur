# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=zoom
pkgver=2.0.81497.0116
pkgrel=1
pkgdesc="Video Conferencing and Web Conferencing Service"
arch=('i686' 'x86_64')
license=('custom')
url="https://zoom.us/"
depends=('glib2' 'gstreamer' 'libxcb' 'xcb-util-image' 'fontconfig' 'mesa' 'libxi' 'libsm' 'libxrender'
	'libpulse' 'libxcomposite' 'libxslt' 'sqlite' 'xcb-util-keysyms' 'qt5-webengine' 'qt5-svg')
options=(!strip)
source_i686=("${pkgname}-${pkgver}_i386.deb"::"https://zoom.us/client/${pkgver}/zoom_i386.deb")
source_x86_64=("${pkgname}-${pkgver}_amd64.deb"::"https://zoom.us/client/${pkgver}/zoom_amd64.deb")
sha512sums_i686=('aebca1f08813db2d2bc36d7bc4cd54258174cc594618c6ca72413e5010ebc3a0a8e87b78ab4eec602b877be65980e9cd90ce55c568046733b400ad3fbe2f0962')
sha512sums_x86_64=('e9e7266860b868b693b3b1148dff0fe30f57b73e6366d376ae3a8252ac226599afeba806c58cccf893cc770c9cf00f48943b9a39f6de3b04173900fddf1e6474')

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
