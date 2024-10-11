# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>

pkgname=monero-gui-static-bin
pkgver=0.18.3.4
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
sha256sums=('2866f3a2be30e4c4113e6274cad1d6698f81c37ceebc6e8f084c57230a0f70a6')

package() {
	cd "monero-gui-v$pkgver"
	install -Dm755 monerod monero-wallet-gui extras/* -t "${pkgdir}/usr/bin/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
