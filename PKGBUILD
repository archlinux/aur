# Maintainer: wmw <efklid@gmail.com>
pkgname=genesis-r14-touchpad-toggle
pkgver=2.0.2
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
sha256sums=('ed3764d61a14901e7f36010cff3ddc3286d95bfcf8061c08c97ddb139c66b7d5')

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 touchpad-toggle        "$pkgdir/usr/bin/touchpad-toggle"
    install -Dm755 touchpad-key-listener  "$pkgdir/usr/bin/touchpad-key-listener"
    install -Dm644 toggle.py              "$pkgdir/usr/lib/touchpad-toggle/toggle.py"
    install -Dm644 touchpad-toggle.service "$pkgdir/usr/lib/systemd/system/touchpad-toggle.service"
    install -Dm644 touchpad-toggle.conf   "$pkgdir/etc/touchpad-toggle.conf"
}
