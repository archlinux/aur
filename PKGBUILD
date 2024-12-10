# Maintainer: root.nix.dk
pkgname='udev-usb-sync'
pkgver=0.12
pkgrel=2
pkgdesc='Fine tune write cache and impose buffer limits when USB storage device is plugged'
arch=('any')
url='https://codeberg.org/wonky/udev-usb-sync'
license=('MIT')
depends=('hdparm' 'bc')
backup=("etc/${pkgname}/${pkgname}.conf")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/wonky/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('65af1d93dba9bab958643ec40c64835166ca27f4659d532dc7f3295b31ad51b5')

package() {
    cd "${pkgname}"
    install -Dm755 99-usb-sync.rules  -t "$pkgdir/etc/udev/rules.d"
    install -Dm755 udev-usb-sync.conf -t "$pkgdir/etc/udev-usb-sync"
    install -Dm755 udev-usb-sync      -t "$pkgdir/usr/bin"
    install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
