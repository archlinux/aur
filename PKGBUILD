# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>
pkgname=bluetooth-headset-battery-level-git
pkgver=r55.d03681d
pkgrel=1
pkgdesc="This is a python script to fetch the battery charge level of some Bluetooth headsets."
arch=('any')
depends=('python-pybluez')
url="https://github.com/TheWeirdDev/Bluetooth_Headset_Battery_Level"
license=(GPL)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/TheWeirdDev/Bluetooth_Headset_Battery_Level")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    install -D -m0755 bluetooth_battery.py ${pkgdir}/usr/bin/bluetooth-headset-battery-level
}
