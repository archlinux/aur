# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=zoom
pkgver=2.0.49177.0430
pkgrel=1
pkgdesc="Video Conferencing and Web Conferencing Service"
arch=('i686' 'x86_64')
license=('custom')
url="https://zoom.us/"
depends=('desktop-file-utils' 'gstreamer0.10-base' 'xcb-util-cursor' 'libxml2'
	'libsm' 'sqlite' 'libxrender' 'fontconfig' 'libxcomposite' 'libxi' 'libgl'
	'openssl' 'libxslt' 'libpulse' 'glib2' 'libxcb')
# The dependencies were reconstructed in order to fit the ones from debian
options=(!strip)
source_i686=("https://zoom.us/client/latest/zoom_${pkgver}_i386.deb")
source_x86_64=("https://zoom.us/client/latest/zoom_${pkgver}_amd64.deb")
md5sums_i686=('ac58b61134beaa5168bd82bc8c0108d9')
md5sums_x86_64=('052f0bb0a82d1fc9cd7f667726b6cd68')

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
