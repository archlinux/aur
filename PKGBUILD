# Maintainer: root.nix.dk
pkgname='udev-usb-sync'
pkgver=0.8
pkgrel=1
pkgdesc='Fine tune write cache and impose buffer limites when USB storage device is plugged'
arch=('any')
url='https://codeberg.org/wonky/udev-usb-sync'
license=('MIT')
depends=('hdparm')
backup=("etc/${pkgname}/${pkgname}.conf")
install="${pkgname}.install"
source=('99-usb-sync.rules' 'udev-usb-sync' 'udev-usb-sync.conf')
sha256sums=('4f5888647d9be47a8992a7f5ea52eadd5baac0295a39751baa496815bddb065f'
            'b514e3bf1ea55f5e1dc4f5af46da3b5f9f2409da1efe7b36a11647704faf0a8f'
            '7cf194b2e3767f8ce4dcbf98b665e46d67624034d5ec0f4cb89f359b677c3687')

package() {
    install -d -m755 "$pkgdir/etc/udev/rules.d"
    install -d -m755 "$pkgdir/etc/$pkgname"
    install -d -m755 "$pkgdir/usr/bin"
    cp "${srcdir}/99-usb-sync.rules" "${pkgdir}/etc/udev/rules.d"
    cp "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    cp "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/${pkgname}"
}
