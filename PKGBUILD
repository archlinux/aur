# Maintainer: pineappletoad

pkgname=arm-linux-gnueabihf-glibc-bin
_toolchain_ver=15.2.rel1
_toolchain_date=20251217
pkgver=${_toolchain_ver}.${_toolchain_date}
pkgrel=1
pkgdesc="glibc libraries for the arm-linux-gnueabihf cross target (precompiled, split from ARM's official GNU toolchain release)"
arch=('x86_64')
url="https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads"
license=('LGPL-2.1-or-later')
options=('!debug' '!strip')
provides=('arm-linux-gnueabihf-glibc')
conflicts=('arm-linux-gnueabihf-glibc')
depends=('arm-linux-gnueabihf-glibc-headers')

_tarball="arm-gnu-toolchain-${_toolchain_ver}-x86_64-arm-none-linux-gnueabihf"
source=("https://developer.arm.com/-/media/Files/downloads/gnu/${_toolchain_ver}/binrel/${_tarball}.tar.xz")
sha256sums=('0e6573d2c7210b9d9cc76ff28a3de9e1084b1883dde4af536b7f01e268c76e31')

package() {
    cd "${srcdir}/${_tarball}"

    install -d "${pkgdir}/usr/arm-none-linux-gnueabihf"
    cp -a arm-none-linux-gnueabihf/lib "${pkgdir}/usr/arm-none-linux-gnueabihf/"
    cp -a arm-none-linux-gnueabihf/libc "${pkgdir}/usr/arm-none-linux-gnueabihf/"

    install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
