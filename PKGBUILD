# Maintainer: Mehmet Ozgur Bayhan <mozgurbayhan@gmail.com>
pkgname=wdb
pkgver=0.0.38
pkgrel=1
pkgdesc='Watchdog for disk and RAM usage in the system tray'
arch=('any')
url='https://gitlab.com/mozgurbayhan/wdb'
license=('GPL-2.0-only' 'GPL-3.0-only')
depends=('bash' 'yad' 'zenity')
optdepends=('libnotify: desktop notifications')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/api/v4/projects/mozgurbayhan%2Fwdb/packages/generic/wdb/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('fb7734905ee5fcad418c2b66183adc1450ca94f2c0664256608d6fd71094f058')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 src/wdb "$pkgdir/usr/bin/wdb"
    install -Dm644 -t "$pkgdir/usr/share/wdb/icons" src/icons/*.svg
    install -Dm644 packaging/wdb.desktop "$pkgdir/usr/share/applications/wdb.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 packaging/NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
