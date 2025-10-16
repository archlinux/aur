# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>

pkgname=monero-gui-static-bin
pkgver=0.18.4.3
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
sha256sums=('0bd84de0a7c18b2a3ea8e8eff2194ae000cf1060045badfd4ab48674bc1b9325')

package() {
	cd "monero-gui-v$pkgver"
	install -Dm755 monerod monero-wallet-gui extras/* -t "${pkgdir}/usr/bin/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
