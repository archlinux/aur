# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=zoom
pkgver=1.1.44485.0317
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
install="${pkgname}.install"
source_i686=("https://zoom.us/client/latest/zoom_${pkgver}_i386.deb")
source_x86_64=("https://zoom.us/client/latest/zoom_${pkgver}_amd64.deb")
md5sums_i686=('df467cf71f69efc99aef87a0d9f5090e')
md5sums_x86_64=('bbd2491960ba8af8b315bb53b5094a40')

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
