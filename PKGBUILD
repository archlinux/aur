# Maintainer: Wartybix <34974060+Wartybix at users dot noreply dot github dot com>
pkgname='reboot-to-windows'
_pkgname='Reboot-To-Windows'
pkgver=1.5
pkgrel=1
pkgdesc="Application to quickly reboot to Windows from Linux, bypassing the boot menu."
arch=('any')
url="https://github.com/Wartybix/Reboot-To-Windows"
license=('GPL-3.0-only')
depends=('polkit' 'efibootmgr' 'bash')
optdepends=('qt5-tools: Reboot screen support for KDE')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('d163f42c84c03f7b825f5f9550c0eb601ad63379eebb17ddc43323d0f02d4eb9')

package() {
	cd "$_pkgname-$pkgver"
	install -Dm755 reboot-to-windows.sh "$pkgdir/usr/bin/reboot-to-windows"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 reboot-to-windows.root.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 icons/reboot-to-windows.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}
