# Maintainer: lambdadroid <lambdadroid@gmail.com>
pkgname=me176c-battery
pkgver=2
pkgrel=2
pkgdesc="Battery configuration files for the ASUS MeMO Pad 7 (ME176C/CX)"
arch=(any)
url="https://github.com/me176c-dev/me176c-archlinux"
license=('MIT')
depends=('systemd' 'me176c-firmware')
options=('!strip')
source=(
    'me176c.mount'
    'upi_ug31xx.service'
    'upi_ug31xx.sysusers.conf'
    'upi_ug31xx.tmpfiles.conf'
    'upi_ug31xx.rules'
)
sha256sums=('fab463ceeed2d92f7c6dcd1a9333e5c008f6e51cf9d4c40b4bfce8a51e7d7936'
            '100a67d7f90bf3a15b6287214f20a386d35383f4812e2c660783413d3636a030'
            'def60f3eede943d6ea179f669f7173d75469368af6fa7dea0245e14fd629b9ff'
            '1d2c114fa9e47e5c122c7c68afaca59b57d57ef3b12e7636c01239e849c00d19'
            '9bdfd9c1cd8e5805f040384f6ded15250cfc9714ae1b5997ba2cd830f6ea7fea')

package() {
    install -Dm644 me176c.mount "$pkgdir"/usr/lib/systemd/system/me176c.mount
    install -Dm644 upi_ug31xx.service "$pkgdir"/usr/lib/systemd/system/upi_ug31xx.service
    install -Dm644 upi_ug31xx.sysusers.conf "$pkgdir"/usr/lib/sysusers.d/upi_ug31xx.conf
    install -Dm644 upi_ug31xx.tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/upi_ug31xx.conf
    install -Dm644 upi_ug31xx.rules "$pkgdir"/usr/lib/udev/rules.d/upi_ug31xx.rules
}
