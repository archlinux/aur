# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>

pkgname=monero-gui-static-bin
pkgver=0.18.3.1
pkgrel=1
pkgdesc="Monero: the secure, private, untraceable peer-to-peer currency"
arch=(x86_64)
url="https://www.getmonero.org/downloads/#gui"
license=('custom')
depends=(
	glib2 glibc libglvnd libx11 libxcb libxkbcommon libxkbcommon-x11 systemd-libs
	xcb-util-image xcb-util-keysyms xcb-util-renderutil xcb-util-wm
)
provides=(monero monero-gui)
conflicts=(monero monero-gui)
source=("https://downloads.getmonero.org/gui/monero-gui-linux-x64-v${pkgver}.tar.bz2")
sha256sums=('06f6e600db51205116d52522964cf9b96337d7b5cb1e101730ccb0039b30e15b')

package() {
	cd "monero-gui-v$pkgver"
	install -Dm755 monerod monero-wallet-gui extras/* -t "${pkgdir}/usr/bin/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
