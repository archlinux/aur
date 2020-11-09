# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=zoom
pkgver=5.4.53391.1108
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
sha512sums=('c543a805130255bec1ad7fc7ccc6dd9a37711d73bd9f2fac62a57913210e1ea54a679ea4627c7166b2c6168e42d1b41f457fc2f6989f57296df4933b0e49f2a1')

prepare() {
	sed -i 's/Zoom\.png/Zoom/g' "${srcdir}/usr/share/applications/Zoom.desktop"
	sed -i 's/StartupWMClass=Zoom/StartupWMClass=zoom/g' "${srcdir}/usr/share/applications/Zoom.desktop"
}

package() {
	cp -dpr --no-preserve=ownership opt usr "${pkgdir}"
}
