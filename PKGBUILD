# Maintainer: root.nix.dk
pkgname='udev-usb-sync'
pkgver=0.3
pkgrel=4
pkgdesc='Fine tune write cache when USB storage device is plugged'
arch=('any')
url='https://codeberg.org/wonky/udev-usb-sync'
license=('MIT')
depends=('hdparm')
provides=("${pkgname}")
backup=("etc/${pkgname}/${pkgname}.conf")
install=${pkgname}.install
source=('99-usb-sync.rules' 'udev-usb-sync.sh' 'udev-usb-sync.conf')
sha256sums=('39e714df856c8d47fe14365b854b9a1b36ed3afa300383d8329452394a01a1c4'
            '4d3588b241d5214faeeac021668627e115e69f62b28454f351daa532082f6324'
            'bc902da2c453355e1dbc3a970a564daf71d41c6278dc771a930aa3badb90e453')

package() {
    install -d -m755 $pkgdir/etc/udev/rules.d
    install -d -m755 $pkgdir/etc/$pkgname
    install -d -m755 $pkgdir/usr/bin
    cp ${srcdir}/99-usb-sync.rules "${pkgdir}/etc/udev/rules.d"
    cp ${srcdir}/${pkgname}.sh "${pkgdir}/usr/bin"
    cp ${srcdir}/${pkgname}.conf "${pkgdir}/etc/${pkgname}"
}
