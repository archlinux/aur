# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=zoom
pkgver=2.0.57232.0713
pkgrel=1
pkgdesc="Video Conferencing and Web Conferencing Service"
arch=('i686' 'x86_64')
license=('custom')
url="https://zoom.us/"
depends=('libx11' 'libsm' 'libxi' 'nss' 'xcb-util-image' 'xcb-util-keysyms' 'libxcb' 'glib2' 'libxshmfence' 'libpulse'
	'pulseaudio-alsa' 'libxfixes' 'libxrandr' 'fontconfig' 'mesa' 'libxrender' 'libxcomposite' 'libxslt' 'gstreamer' 'ibus'
	'ibus-qt')
# The dependencies are those from the original package
options=(!strip)
source_i686=("https://zoom.us/client/latest/zoom_${pkgver}_i386.deb")
source_x86_64=("https://zoom.us/client/latest/zoom_${pkgver}_amd64.deb")
md5sums_i686=('5db442015916f528bdf5f4d22dfed90d')
md5sums_x86_64=('aaf14b8075a9500b58b74f9ff63beea0')

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
