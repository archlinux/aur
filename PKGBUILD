# Maintainer: root.nix.dk
pkgname='udev-usb-sync'
pkgver=0.9
pkgrel=2
pkgdesc='Fine tune write cache and impose buffer limits when USB storage device is plugged'
arch=('any')
url='https://gitlab.manjaro.org/fhdk/udev-usb-sync'
license=('MIT')
depends=('hdparm' 'bc')
backup=("etc/${pkgname}/${pkgname}.conf")
install="${pkgname}.install"
source=('99-usb-sync.rules' 'udev-usb-sync' 'udev-usb-sync.conf')
sha256sums=('fde345c047bbb3fb51cb2a66b6106a883a413638b760e0e8087c692a30f87514'
            'bdc35135e6f8074890a911a501ca4fb3e6a7888963b51c3a1edb98c23bb62ec2'
            'ec26baede73e94f9cfab77cd5aa6e0ffebcc413ff657a4e98eae6c9e2145655e')

package() {
    install -d -m755 "$pkgdir/etc/udev/rules.d"
    install -d -m755 "$pkgdir/etc/$pkgname"
    install -d -m755 "$pkgdir/usr/bin"
    cp "${srcdir}/99-usb-sync.rules" "${pkgdir}/etc/udev/rules.d"
    cp "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    cp "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/${pkgname}"
}
