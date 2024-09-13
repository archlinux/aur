# Maintainer: root.nix.dk
pkgname='udev-usb-sync'
pkgver=0.10
pkgrel=1
pkgdesc='Fine tune write cache and impose buffer limits when USB storage device is plugged'
arch=('any')
url='https://codeberg.org/wonky/udev-usb-sync'
license=('MIT')
depends=('hdparm' 'bc')
backup=("etc/${pkgname}/${pkgname}.conf")
install="${pkgname}.install"
source=('99-usb-sync.rules' 'udev-usb-sync' 'udev-usb-sync.conf')
sha256sums=('fde345c047bbb3fb51cb2a66b6106a883a413638b760e0e8087c692a30f87514'
            'b0b34904c7d807507b314d308bfa9375a6e36e2d9b551fd51826cbbd4e752e2e'
            'ec26baede73e94f9cfab77cd5aa6e0ffebcc413ff657a4e98eae6c9e2145655e')

package() {
    install -d -m755 "$pkgdir/etc/udev/rules.d"
    install -d -m755 "$pkgdir/etc/$pkgname"
    install -d -m755 "$pkgdir/usr/bin"
    cp "${srcdir}/99-usb-sync.rules" "${pkgdir}/etc/udev/rules.d"
    cp "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    cp "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/${pkgname}"
}
