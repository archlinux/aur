# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=zoom
pkgver=5.0.418682.0603
pkgrel=1
pkgdesc="Video Conferencing and Web Conferencing Service"
arch=('x86_64')
license=('custom')
url="https://zoom.us/"
depends=('fontconfig' 'glib2' 'libpulse' 'libsm' 'ttf-font' 'libx11' 'libxcb' 'libxcomposite' 'libxfixes' 'libxi' 'libxcursor'
	'libxkbcommon-x11' 'libxrandr' 'libxrender' 'libxshmfence' 'libxslt' 'mesa' 'nss' 'pulseaudio-alsa' 'xcb-util-image' 'xcb-util-keysyms')
optdepends=('qt5-webengine: SSO login support'
			'picom: extra compositor needed by some window managers for screen sharing'
			'xcompmgr: extra compositor needed by some window managers for screen sharing')
options=(!strip)
source=("${pkgname}-${pkgver}_orig_x86_64.pkg.tar.xz"::"https://zoom.us/client/${pkgver}/zoom_x86_64.pkg.tar.xz")
sha512sums=('24653e1ca48dbf7ce245481c577a6d3f660e7b0cc7bc83785456f33659d5ce97b2bff7870e2df8ecf8aeea2fb70d9c284c93613c7bc710a221cc57333f9f37a5')

prepare() {
	sed -i 's/Zoom\.png/Zoom/g' "${srcdir}/usr/share/applications/Zoom.desktop"
}

package() {
	cp -dpr --no-preserve=ownership opt usr "${pkgdir}"
}
