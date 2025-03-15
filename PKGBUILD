# Maintainer: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>

pkgname=usbbluetooth
pkgver=0.0.6
pkgrel=1
arch=('any')
pkgdesc='Take full control of your USB Bluetooth controllers!'
url='https://github.com/antoniovazquezblanco/usbbluetooth'
depends=('libusb'
         'argtable3')
makedepends=('meson')
source=("https://github.com/antoniovazquezblanco/usbbluetooth/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('2e848e3949ba1e222a8757e40301ac7cb48e6aa9e108b27186d0dbcaceb3648a3a82c6474c90793646c8f8b41d1939263c9b395a410cc420de2dee4f05238293')

build() {
    arch-meson "usbbluetooth-${pkgver}" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
