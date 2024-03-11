# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>

pkgname=monero-gui-static-bin
pkgver=0.18.3.2
pkgrel=1
pkgdesc="Monero: the secure, private, untraceable peer-to-peer currency"
arch=(x86_64)
url="https://www.getmonero.org/downloads/#gui"
license=('BSD-3-Clause')
depends=(
	glib2 glibc libglvnd libx11 libxcb libxkbcommon libxkbcommon-x11 systemd-libs
	xcb-util-image xcb-util-keysyms xcb-util-renderutil xcb-util-wm
)
provides=(monero monero-gui)
conflicts=(monero monero-gui)
source=("https://downloads.getmonero.org/gui/monero-gui-linux-x64-v${pkgver}.tar.bz2")
sha256sums=('98772e56afe5509ed4bd3d36ee2ea3c70c019cb4325c18d3508291fcdc784d4f')

package() {
	cd "monero-gui-v$pkgver"
	install -Dm755 monerod monero-wallet-gui extras/* -t "${pkgdir}/usr/bin/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
