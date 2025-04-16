# Maintainer: Hadi Chokr <hadichokr@icloud.com>

pkgname=usb-dirty-pages-udev
pkgver=23.10.15
pkgrel=1
pkgdesc="Use udev to specify dirty pages for USB devices (i.e. cache in RAM before writing files)"
arch=('any')
url="https://github.com/biglinux/$pkgname"
license=('GPL-3.0-or-later')
provides=("$pkgname")
source=("git+${url}.git#tag=usb-dirty-pages-udev-23.10.15-2049")
md5sums=('SKIP')
install="usb-dirty-pages-udev.install"

package() {
    # Install the udev rules file
    install -Dm 644 "${srcdir}/${pkgname}/etc/udev/rules.d/60-usb-dirty-pages-udev.rules" "$pkgdir/etc/udev/rules.d/60-usb-dirty-pages-udev.rules"
    
    # Install the script with executable permissions
    install -Dm 755 "${srcdir}/${pkgname}/usr/bin/usb-dirty-pages-udev" "$pkgdir/usr/bin/usb-dirty-pages-udev"
}
