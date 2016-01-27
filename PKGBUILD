# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=zoom
pkgver=1.1.38634.0127
pkgrel=1
pkgdesc="Video Conferencing and Web Conferencing Service"
arch=('i686' 'x86_64')
license=('custom')
url="https://zoom.us/"
depends=('desktop-file-utils' 'gstreamer0.10-base' 'xcb-util-cursor')
depends_i686+=('lib32-libxml2' 'lib32-libsm' 'lib32-sqlite' 'lib32-libxrender'
	'lib32-fontconfig' 'lib32-libxcomposite' 'lib32-libxi' 'lib32-libgl' 'lib32-openssl'
	'lib32-libxslt' 'lib32-libpulse' 'lib32-glib2' 'lib32-libxcb')
depends_x86_64+=('libxml2' 'libsm' 'sqlite' 'libxrender'
	'fontconfig' 'libxcomposite' 'libxi' 'libgl' 'openssl'
	'libxslt' 'libpulse' 'glib2' 'libxcb')
# The dependencies were reconstructed in order to fit the ones from debian
options=(!strip)
install=${pkgname}.install
source_i686=("https://zoom.us/client/latest/zoom_${pkgver}_i386.deb")
source_x86_64=("https://zoom.us/client/latest/zoom_${pkgver}_amd64.deb")
md5sums_i686=('04a048120906b08af9cdd97f5152513d')
md5sums_x86_64=('006f07c7294a9fbaadef6ee3543dbeaf')

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
