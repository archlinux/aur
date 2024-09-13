# Maintainer: root.nix.dk
pkgname='udev-usb-sync'
pkgver=0.12
pkgrel=1
pkgdesc='Fine tune write cache and impose buffer limits when USB storage device is plugged'
arch=('any')
url='https://codeberg.org/wonky/udev-usb-sync'
license=('MIT')
depends=('hdparm' 'bc')
backup=("etc/${pkgname}/${pkgname}.conf")
install="${pkgname}.install"
source=('99-usb-sync.rules' 'udev-usb-sync' 'udev-usb-sync.conf')
sha256sums=('b1463dc2f102b31d16b8e9b3ba39356bdf6ec791b6b2034f3ded5553f4c31f8a'
            '741fbc305c151c88dad3bdb2203289855c7dc2a2a7d581c8e325dd8ed286c6dc'
            'ec26baede73e94f9cfab77cd5aa6e0ffebcc413ff657a4e98eae6c9e2145655e')

package() {
    install -d -m755 "$pkgdir/etc/udev/rules.d"
    install -d -m755 "$pkgdir/etc/$pkgname"
    install -d -m755 "$pkgdir/usr/bin"
    cp "${srcdir}/99-usb-sync.rules" "${pkgdir}/etc/udev/rules.d"
    cp "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    cp "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/${pkgname}"
}
