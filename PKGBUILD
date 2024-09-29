# Maintainer: Wartybix <34974060+Wartybix at users dot noreply dot github dot com>
pkgname='reboot-to-windows'
_pkgname='Reboot-To-Windows'
pkgver=1.4.1
pkgrel=1
pkgdesc="Application to quickly reboot to Windows from Linux, bypassing the boot menu."
arch=('any')
url="https://github.com/Wartybix/Reboot-To-Windows"
license=('GPL-3.0-only')
depends=('polkit' 'efibootmgr' 'bash')
optdepends=('qt5-tools: Reboot screen support for KDE')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('520b12d1b0ecb14b2d28685a0763a063c25a4738cfcb5aa9c5a2f53e5ec14a17')

package() {
	cd "$_pkgname-$pkgver"
	install -Dm755 reboot-to-windows.sh "$pkgdir/usr/bin/reboot-to-windows"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 reboot-to-windows.root.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 icons/reboot-to-windows.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}
