# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=sixad-git
pkgver=1.5.1_93388dc
pkgrel=3
pkgdesc='Connects and manages various official PS3 controllers'
url='https://github.com/RetroPie/sixad'
arch=('x86_64')
license=('GPL2')
makedepends=(make libusb libusb-compat bluez-libs dbus libdbusmenu-glib)
depends=(bluez bluez-hcitool bluez-hciconfig)

source=("git+https://github.com/RetroPie/sixad.git")
sha512sums=(SKIP)

build() {
  cd "$srcdir"/sixad
  make
}

package() {
    cd "$srcdir"/sixad
    mkdir -p "$pkgdir"/usr/bin/
    install -D bins/* "$pkgdir"/usr/bin/
    install -D sixad "$pkgdir"/usr/bin/
}
