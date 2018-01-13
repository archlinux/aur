# Maintainer: lambdadroid <lambdadroid@gmail.com>
pkgname=me176c-battery
pkgver=1
pkgrel=1
pkgdesc="Battery configuration files for the ASUS MeMO Pad 7 (ME176C/CX)"
arch=(any)
url="https://github.com/me176c-dev/me176c-archlinux"
license=('MIT')
depends=('systemd' 'me176c-firmware')
options=('!strip')
source=(
    'oemcfg.mount'
    'upi_ug31xx.service'
    'upi_ug31xx.sysusers.conf'
    'upi_ug31xx.tmpfiles.conf'
    'upi_ug31xx.rules'
)
sha256sums=('3ffeedc559f9a664814e1d315db72c17eef658e66f4445f599a2a19015bca446'
            '63094bda10ddc05344d05512c496ba6f9b78442ceda739510ef9b0f577870d2a'
            '99d0acbc6ce120f047664d3c41449658e2addd69a869704530be1b4e7c7e92f4'
            '9ae6f1934e403332eb50fb297155a0b837c4328ae1e157372ee759be666985dd'
            '9bdfd9c1cd8e5805f040384f6ded15250cfc9714ae1b5997ba2cd830f6ea7fea')

package() {
    install -Dm644 oemcfg.mount "$pkgdir"/usr/lib/systemd/system/oemcfg.mount
    install -Dm644 upi_ug31xx.service "$pkgdir"/usr/lib/systemd/system/upi_ug31xx.service
    install -Dm644 upi_ug31xx.sysusers.conf "$pkgdir"/usr/lib/sysusers.d/upi_ug31xx.conf
    install -Dm644 upi_ug31xx.tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/upi_ug31xx.conf
    install -Dm644 upi_ug31xx.rules "$pkgdir"/usr/lib/udev/rules.d/upi_ug31xx.rules
}
