# Maintainer: root.nix.dk
pkgname='arch-udev-usb-sync'
_orgname='udev-usb-sync'
pkgver=1.0
pkgrel=1
pkgdesc='Fine tune write cache and impose buffer limits when USB storage device is plugged'
arch=('any')
url='https://gitlab.manjaro.org/applications/udev-usb-sync'
license=('MIT')
depends=('hdparm' 'bc')
makedepends=('git')
backup=("etc/${_orgname}/${_orgname}.conf")
conflicts=('udev-usb-sync')
install="${pkgname}.install"
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('3521ec30dc7f769e80376a6f1b90cdc5b919a20fd9061cdaec50888f7fe1c72b')

package() {
    cd "$srcdir/udev-usb-sync"
    install -Dm644 99-usb-sync.rules  -t "$pkgdir/usr/lib/udev/rules.d"
    install -Dm644 udev-usb-sync.conf -t "$pkgdir/etc/udev-usb-sync"
    install -Dm755 udev-usb-sync      -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
