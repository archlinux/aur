# Maintainer: Mikhail Velichko <efklid@gmail.com>
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=genesis-r14-touchpad-toggle
pkgver=2.0.3
pkgrel=1
pkgdesc='Touchpad toggle key fix for Machcreator Genesis R14'
url='https://github.com/Labaman/genesis-r14-touchpad-toggle'
arch=('any')
license=('MIT')
depends=('python' 'python-evdev' 'python-dbus')
provides=('touchpad-toggle')
conflicts=('touchpad-toggle' 'touchpad-toggle-xinput')
backup=('etc/touchpad-toggle.conf')
install=touchpad-toggle.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Labaman/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0c554f9a0079a8582f07cd251c81104480adfb53a4d98effb5d8ec3448a4ead1')

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 touchpad-toggle        "$pkgdir/usr/bin/touchpad-toggle"
    install -Dm755 touchpad-key-listener  "$pkgdir/usr/bin/touchpad-key-listener"
    install -Dm644 toggle.py              "$pkgdir/usr/lib/touchpad-toggle/toggle.py"
    install -Dm644 touchpad-toggle.service "$pkgdir/usr/lib/systemd/system/touchpad-toggle.service"
    install -Dm644 touchpad-toggle.conf   "$pkgdir/etc/touchpad-toggle.conf"
    install -Dm644 LICENSE                "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
