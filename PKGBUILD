# Maintainer: Til Kaiser <mail at tk154 dot de>
pkgname=windscribe-v2-bin
pkgver=2.23.12
pkgrel=2
pkgdesc="Windscribe GUI tool for Linux"
arch=('x86_64')
url="https://windscribe.com/guides/linux"
license=('GPL2')
depends=('nftables' 'c-ares' 'freetype2' 'hicolor-icon-theme' 'systemd' 'glibc>=2.28' 'glib2' 'zlib' 'gcc-libs' 'dbus' 'libglvnd' 'fontconfig' 'libx11' 'libxkbcommon' 'libxcb' 'net-tools' 'xcb-util-wm' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'sudo' 'shadow')
provides=('windscribe')
conflicts=('windscribe-cli' 'windscribe')
options=('!strip')
install=windscribe-v2-bin.install
source=("https://github.com/Windscribe/Desktop-App/releases/download/v${pkgver}/windscribe_${pkgver}_amd64.pkg.tar.zst")
sha1sums=('1133a4d633f43da93015ce6ee6af6e33ac1d3e67')

package() {
	mv ${srcdir}/etc ${pkgdir}
	mv ${srcdir}/opt ${pkgdir}
	mv ${srcdir}/usr ${pkgdir}

	# Fix permissions on systemd unit
	chmod -x ${pkgdir}/usr/lib/systemd/system/windscribe-helper.service
}
