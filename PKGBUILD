# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=zoom
pkgver=1.1.37479.0107
pkgrel=2
pkgdesc="Video Conferencing and Web Conferencing Service"
arch=('i686' 'x86_64')
license=('custom')
url="https://zoom.us/"
depends_i686=('desktop-file-utils' 'lib32-libxml2' 'lib32-libsm' 'lib32-sqlite' 'lib32-libxrender'
	'lib32-fontconfig' 'lib32-libxcomposite' 'lib32-libxi' 'lib32-libgl' 'lib32-openssl' 'lib32-xcb-util'
	'lib32-libxslt' 'lib32-libpulse' 'lib32-glib2' 'gst-plugins-base-libs' 'lib32-libxcb')
depends_x86_64=('desktop-file-utils' 'libxml2' 'libsm' 'sqlite' 'libxrender'
	'fontconfig' 'libxcomposite' 'libxi' 'libgl' 'openssl' 'xcb-util'
	'libxslt' 'libpulse' 'glib2' 'gst-plugins-base-libs' 'libxcb')
# The dependencies were reconstructed in order to fit the ones from debian
options=(!strip)
install=${pkgname}.install
source_i686=("https://zoom.us/client/latest/zoom_${pkgver}_i386.deb")
source_x86_64=("https://zoom.us/client/latest/zoom_${pkgver}_amd64.deb")
md5sums_i686=('ec7bb2220765334181bae35247a08fa4')
md5sums_x86_64=('32233200a1f1892526931b6de25a7957')

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
