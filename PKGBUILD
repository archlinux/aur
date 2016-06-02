# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=zoom
pkgver=2.0.52458.0531
pkgrel=1
pkgdesc="Video Conferencing and Web Conferencing Service"
arch=('i686' 'x86_64')
license=('custom')
url="https://zoom.us/"
depends=('desktop-file-utils' 'gstreamer0.10-base' 'xcb-util-cursor' 'libxml2'
	'libsm' 'sqlite' 'libxrender' 'fontconfig' 'libxcomposite' 'libxi' 'libgl'
	'openssl' 'libxslt' 'pulseaudio' 'glib2' 'libxcb' 'qt5-webkit' 'qt5-svg' 'qt5-script')
# The dependencies were reconstructed in order to fit the ones from debian
options=(!strip)
source_i686=("https://zoom.us/client/latest/zoom_${pkgver}_i386.deb")
source_x86_64=("https://zoom.us/client/latest/zoom_${pkgver}_amd64.deb")
md5sums_i686=('f26ae1bf43c94af7879f50fb9d7c2955')
md5sums_x86_64=('f9aa119d96d026abb812873ef2093ffc')

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
