# Maintainer: Bardia Moshiri <fakeshell@bardia.tech>
pkgname='batman'
pkgver=0.32
pkgrel=1
pkgdesc="A battery management service and program for linux phones"
arch=(any)
url="https://github.com/FakeShell/batman"
license=('GPLv2')
depends=('yad' 'wlr-randr' 'upower' 'bash')
makedepends=('git' 'tar')
provides=('batman')
source=('https://github.com/FakeShell/batman/releases/download/batman/batman.tar.gz')
md5sums=('SKIP')

prepare() {
        tar -xf batman.tar.gz
        rm -f batman.tar.gz
}

package() {
        cd "$pkgname"
        install -Dm755 ./batman "$pkgdir/usr/bin/batman"
        install -Dm755 ./batman-gui "$pkgdir/usr/bin/batman-gui"
        install -Dm755 ./governor "$pkgdir/usr/bin/governor"
        install -Dm644 ./config "$pkgdir/var/lib/$pkgname/config"
        install -Dm644 ./batman.service "$pkgdir/usr/lib/systemd/system/batman.service"
        install -Dm644 ./batman.png "$pkgdir/usr/share/icons/batman.png"
        install -Dm644 ./batman-gui.desktop "$pkgdir/usr/share/applications/batman-gui.desktop"
    echo
    echo
    echo -------------------------------------------------------------
    echo 'do systemctl enable batman and reboot to finish the installation'
    echo -------------------------------------------------------------
    echo
    echo
}
