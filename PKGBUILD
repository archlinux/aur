# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=zoom
pkgver=5.1.422789.0705
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
sha512sums=('27bdde9d6abedbf2d725a292bc904cbc2c65240c71a1a8128cf5cd566afe63aeb0905a908d4c727120dc8a97ee6acbed129391ddd31adaecaf6207f0c0e0d30c')

prepare() {
	sed -i 's/Zoom\.png/Zoom/g' "${srcdir}/usr/share/applications/Zoom.desktop"
}

package() {
	cp -dpr --no-preserve=ownership opt usr "${pkgdir}"
}
