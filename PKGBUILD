# Maintainer: root.nix.dk
pkgname='udev-usb-sync'
pkgver=0.6
pkgrel=1
pkgdesc='Fine tune write cache when USB storage device is plugged'
arch=('any')
url='https://codeberg.org/wonky/udev-usb-sync'
license=('MIT')
depends=('hdparm')
provides=("${pkgname}")
backup=("etc/${pkgname}/${pkgname}.conf")
install=${pkgname}.install
source=('99-usb-sync.rules' 'udev-usb-sync' 'udev-usb-sync.conf')
sha256sums=('be08224041008876efb09e6b2a119d6f42b911efecf0563be413f9ff2d33a7b3'
            '8d16ac2e912fa12c2ea79a8de4b94588b8f9e658fd8a3bf1e65bc8e5318c3140'
            'bc902da2c453355e1dbc3a970a564daf71d41c6278dc771a930aa3badb90e453')

package() {
    install -d -m755 $pkgdir/etc/udev/rules.d
    install -d -m755 $pkgdir/etc/$pkgname
    install -d -m755 $pkgdir/usr/bin
    cp ${srcdir}/99-usb-sync.rules "${pkgdir}/etc/udev/rules.d"
    cp ${srcdir}/${pkgname} "${pkgdir}/usr/bin"
    cp ${srcdir}/${pkgname}.conf "${pkgdir}/etc/${pkgname}"
}
