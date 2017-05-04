# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>

pkgname=t200ta-bluetooth
pkgver=r1
pkgrel=2
pkgdesc="Bluetooth service and lib for ASUS T200TA (and possibly other BayTrail devices)"
arch=('any')
url="https://github.com/DX37/T200TA"
license=('GPL')
depends=('bluez' 'bluez-utils')
optdepends=('blueman: GUI for Bluetooth controling')
install=$pkgname.install
source=("BCM43341B0.hcd"
        "btattach.service")
md5sums=('b0d4f0e9dde065cfa8cb6e9a77a4dfb2'
         '600d70a51614a827b8201630c374705c')

package() {
    # Installing needed files. Everything else will do t200ta-bluetooth.install
    install -Dm644 BCM43341B0.hcd "$pkgdir"/usr/lib/firmware/brcm/BCM43341B0.hcd
    install -Dm644 btattach.service "$pkgdir"/etc/systemd/system/btattach.service
}
