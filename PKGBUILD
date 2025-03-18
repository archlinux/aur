# Maintainer: root.nix.dk
pkgname='arch-udev-usb-sync'
pkgver=0.12
pkgrel=3
pkgdesc='Fine tune write cache and impose buffer limits when USB storage device is plugged'
arch=('any')
url='https://codeberg.org/wonky/arch-udev-usb-sync'
license=('MIT')
depends=('hdparm' 'bc')
conflicts=('udev-usb-sync')
backup=("etc/udev-usb-sync/udev-usb-sync.conf")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/wonky/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('860efd8c14e67576d1cd8d5b6ae0065d478fa7a020f0ad7f2768b20f132390c3')

package() {
    cd "${pkgname}"
    install -Dm755 99-usb-sync.rules  -t "$pkgdir/etc/udev/rules.d"
    install -Dm755 udev-usb-sync.conf -t "$pkgdir/etc/udev-usb-sync"
    install -Dm755 udev-usb-sync      -t "$pkgdir/usr/bin"
    install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
