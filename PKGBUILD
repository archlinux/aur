# Maintainer: wmw <efklid@gmail.com>
pkgname=genesis-r14-touchpad-toggle
pkgver=2.0.1
pkgrel=1
pkgdesc='Touchpad toggle key fix for Machcreator Genesis R14'
arch=('any')
license=('MIT')
depends=('python' 'python-evdev' 'python-dbus')
provides=('touchpad-toggle')
conflicts=('touchpad-toggle' 'touchpad-toggle-xinput')
backup=('etc/touchpad-toggle.conf')
install=touchpad-toggle.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Labaman/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('17379b0ef458e4a2f7ffd8ed4297eda26d28fd9d11bc3b77f4a715e061e3793c')

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 touchpad-toggle        "$pkgdir/usr/bin/touchpad-toggle"
    install -Dm755 touchpad-key-listener  "$pkgdir/usr/bin/touchpad-key-listener"
    install -Dm644 toggle.py              "$pkgdir/usr/lib/touchpad-toggle/toggle.py"
    install -Dm644 touchpad-toggle.service "$pkgdir/usr/lib/systemd/system/touchpad-toggle.service"
    install -Dm644 touchpad-toggle.conf   "$pkgdir/etc/touchpad-toggle.conf"
}
