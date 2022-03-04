# Maintainer: cropinghigh <joinmark60@gmail.com>

pkgname=rtl8812au-dkms-aircrack-git
_pkgbase=rtl8812au
pkgver=5.6.4.2.r1174.g3a6402e
pkgrel=1
pkgdesc="rtl8812AU chipset driver from aircrack"
arch=('i686' 'x86_64')
url="https://github.com/aircrack-ng/rtl8812au.git"
license=('GPL2')
depends=('dkms')
makedepends=('git')
conflicts=("${_pkgbase}")
source=("git+https://github.com/aircrack-ng/rtl8812au.git")
sha256sums=('SKIP')
pkgver() {
    cd ${srcdir}/rtl8812au
    printf '%s.r%s.g%s' '5.6.4.2' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${srcdir}/rtl8812au
    mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
}
