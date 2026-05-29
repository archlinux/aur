# Maintainer: root.nix.dk
pkgname='arch-udev-usb-sync'
_orgname='udev-usb-sync'
pkgver=1.1
pkgrel=2
pkgdesc='Fine tune write cache and impose buffer limits when USB storage device is plugged'
arch=('any')
url='https://gitlab.manjaro.org/applications/udev-usb-sync'
license=('MIT')
depends=('hdparm' 'bc' 'udev')
makedepends=('git')
backup=("etc/${_orgname}/${_orgname}.conf")
conflicts=('udev-usb-sync')
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('306b5326d33db9a74a7e3467812e4168f1cc29ade37b5fb6a080f4fdf5e86f23')

package() {
    cd "$srcdir/udev-usb-sync"
    install -Dm644 99-usb-sync.rules  -t "$pkgdir/usr/lib/udev/rules.d"
    install -Dm644 udev-usb-sync.conf -t "$pkgdir/etc/udev-usb-sync"
    install -Dm755 udev-usb-sync      -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
