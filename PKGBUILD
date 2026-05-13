# Maintainer: Gao Zimu <gaozimu_0502@163.com>
pkgname=easytier-gui-bin
pkgver=2.6.4
pkgrel=1
pkgdesc="A simple, decentralized mesh VPN with WireGuard support."
arch=("x86_64" "aarch64")
url="https://github.com/EasyTier/EasyTier"
license=('LGPL-3.0-only')
depends=("webkit2gtk-4.1" "gtk3" "libappindicator")
options=(!strip)
source_x86_64=("https://github.com/EasyTier/EasyTier/releases/download/v${pkgver}/easytier-gui_${pkgver}_amd64.deb")
sha256sums_x86_64=('0d916a68420adbd4e1cce9c516bbf287c6594b549304d28effdd1eb43632dee5')
sha256sums_aarch64=('4fcbe014cabb95ae40c0f894e1c0ba7245906f67643b1d4ce51da02738ce4af5')
source_aarch64=("https://github.com/EasyTier/EasyTier/releases/download/v${pkgver}/easytier-gui_${pkgver}_arm64.deb")

package() {
	bsdtar -xf data.tar.gz -C "$pkgdir/"

	sed -i 's/^Categories=$/Categories=Utility;Network;/' "$pkgdir/usr/share/applications/easytier-gui.desktop"
}
