# Maintainer: kyndair <kyndair at gmail dot com>
# Place the gog installation file in the same folder as this PKGBUILD
pkgname=zoom-bin
pkgver=5.7.4
_build=28991.0726
pkgrel=1
pkgdesc="Repacks the zoom binary provided by Zoom Video Communications, Inc. to AUR norms."
arch=('x86_64')
url="https://zoom.us/download"
license=('custom')
provides=('zoom')
conflicts=('zoom' 'zoom-system-qt')
depends=('libx11' 'libxtst' 'libsm' 'libxi' 'nss' 'xcb-util-image' 'xcb-util-keysyms' 'libxcb' 'glib2' 'libxshmfence' 'libpulse' 'pulseaudio-alsa' 'libxfixes' 'libxrandr' 'fontconfig' 'mesa' 'libxrender' 'libxcomposite' 'libxslt' 'dbus' 'ibus')
install=zoom-bin.install
source=("https://zoom.us/client/latest/zoom_x86_64.pkg.tar.xz")
sha256sums=('36807dab1b2e1ac8b0b19dd8f85dd6669b33ba33c15ff9de86d14523e28f5791')

prepare() {
    tar -xf zoom_x86_64.pkg.tar.xz
    mv .INSTALL ../zoom-bin.install
}

package() {
	# remove incorrect package info
	rm "${srcdir}/.MTREE"
	rm "${srcdir}/.PKGINFO"
	# move data from src tp pkg
	mv "${srcdir}/opt" "${pkgdir}/opt"
	mv "${srcdir}/usr" "${pkgdir}/usr"
}
