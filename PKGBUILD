# Maintainer: StonyTark <krazykid1117@gmail.com>
pkgname=logitech-g923-xbox-ffb-udev
pkgver=1.0.0
pkgrel=2
pkgdesc="Udev rule granting input-group access to /dev/hidraw nodes of the Logitech G923 Racing Wheel for Xbox One and PC (046d:c26e), enabling force feedback through Proton's winebus.sys"
arch=('any')
url="https://github.com/StonyTark1117/logitech-g923-xbox-ffb-udev"
license=('MIT')
depends=('systemd' 'logitech-g923-xbox-udev')
install="${pkgname}.install"
source=("70-${pkgname}.rules"
        'LICENSE')
sha256sums=('SKIP'
            'SKIP')

package() {
    install -Dm644 "$srcdir/70-${pkgname}.rules" \
        "$pkgdir/usr/lib/udev/rules.d/70-${pkgname}.rules"
    install -Dm644 "$srcdir/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
