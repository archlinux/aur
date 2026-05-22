# Maintainer: Davi Alves Sampaio <davialvessampaio00@gmail.com>
pkgname=simple-battery-notify
pkgver=1.0.4
pkgrel=3
pkgdesc="A customizable, D-Bus driven battery notification daemon and CLI"
arch=('any')
url="https://github.com/Davi-S/simple-battery-notify"
license=('GPL3')
depends=('python' 'python-gobject' 'python-pydbus' 'libnotify' 'upower')

source=("$pkgname-$pkgver.tar.gz::https://github.com/Davi-S/simple-battery-notify/archive/refs/tags/${pkgver}.tar.gz")

# Remember to run updpkgsums or makepkg -g to replace this SKIP!
sha256sums=('9ecb4e39cd31183bf0ccc6cd023c29b3d930697ec8dbeacad32e54d6ed5bc6dd')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install the main Python executable
    install -Dm755 "battery-notify" "$pkgdir/usr/bin/battery-notify"

    # Install the default configuration
    install -Dm644 "battery-notify.json" "$pkgdir/etc/battery-notify.json"

    # Install the systemd user service
    install -Dm644 "battery-notify.service" "$pkgdir/usr/lib/systemd/user/battery-notify.service"
}

