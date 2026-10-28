# Maintainer: Mehmet Ozgur Bayhan <mozgurbayhan@gmail.com>
pkgname=wdb
pkgver=1.1.0
pkgrel=1
pkgdesc='Watchdog and notifier for disk and RAM usage in the system tray'
arch=('any')
url='https://gitlab.com/mozgurbayhan/wdb'
license=('GPL-2.0-only' 'GPL-3.0-only')
depends=('bash' 'yad' 'zenity')
optdepends=('libnotify: desktop notifications')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/api/v4/projects/mozgurbayhan%2Fwdb/packages/generic/wdb/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('cb8fe1ab2225d8fbc0e371ba8358974dca2e725ef23e8c4f21949e462a401941')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 src/wdb "$pkgdir/usr/bin/wdb"
    install -Dm644 -t "$pkgdir/usr/share/wdb/icons" src/icons/*.svg
    install -Dm644 packaging/wdb.desktop "$pkgdir/usr/share/applications/wdb.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 packaging/NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
