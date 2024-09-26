# Maintainer: Wartybix <34974060+Wartybix at users dot noreply dot github dot com>
pkgname='reboot-to-windows'
_pkgname='Reboot-To-Windows'
pkgver=1.2
pkgrel=1
pkgdesc="Application to quickly reboot to Windows from Linux, bypassing the boot menu."
arch=('any')
url="https://github.com/Wartybix/Reboot-To-Windows"
license=('GPL-3.0-only')
depends=('polkit' 'efibootmgr' 'bash')
optdepends=('qt5-tools: Reboot screen support for KDE')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('25823808407ef5165b14735a332b476fcc8ddaefc770ddf9fbda9dd7e589c5bc')

package() {
	cd "$_pkgname-$pkgver"
	install -Dm755 reboot-to-windows.sh "$pkgdir/usr/bin/reboot-to-windows"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 wartybix-windows-root.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 windows_logo.png "$pkgdir/usr/share/$pkgname/windows_logo.png"
}
