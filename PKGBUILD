# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=zoom
pkgver=5.3.472687.1012
pkgrel=1
pkgdesc="Video Conferencing and Web Conferencing Service"
arch=('x86_64')
license=('custom')
url="https://zoom.us/"
depends=('fontconfig' 'glib2' 'libpulse' 'libsm' 'ttf-font' 'libx11' 'libxcb' 'libxcomposite' 'libxfixes' 'libxi' 'libxcursor'
	'libxkbcommon-x11' 'libxrandr' 'libxrender' 'libxshmfence' 'libxslt' 'mesa' 'nss' 'xcb-util-image' 'xcb-util-keysyms')
optdepends=('pulseaudio-alsa: audio via PulseAudio'
	'qt5-webengine: SSO login support'
	'picom: extra compositor needed by some window managers for screen sharing'
	'xcompmgr: extra compositor needed by some window managers for screen sharing')
options=(!strip)
source=("${pkgname}-${pkgver}_orig_x86_64.pkg.tar.xz"::"https://zoom.us/client/${pkgver}/zoom_x86_64.pkg.tar.xz")
sha512sums=('99b9cc5743e92fa5472ca33e1cbe5668d978d96530822d372b7227502d41ef33789035b74160945d5eb08e57cf3762f524f8ece087fc0f5c7ce05ad0ba41abf7')

prepare() {
	sed -i 's/Zoom\.png/Zoom/g' "${srcdir}/usr/share/applications/Zoom.desktop"
	sed -i 's/StartupWMClass=Zoom/StartupWMClass=zoom/g' "${srcdir}/usr/share/applications/Zoom.desktop"
}

package() {
	cp -dpr --no-preserve=ownership opt usr "${pkgdir}"
}
