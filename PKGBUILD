# Maintainer: pineappletoad

pkgname=arm-linux-gnueabihf-glibc-headers-bin
_toolchain_ver=15.2.rel1
_toolchain_date=20251217
pkgver=${_toolchain_ver}.${_toolchain_date}
pkgrel=1
pkgdesc="glibc headers for the arm-linux-gnueabihf cross target (precompiled, split from ARM's official GNU toolchain release)"
arch=('x86_64')
url="https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads"
license=('LGPL-2.1-or-later')
options=('!debug' '!strip')
provides=('arm-linux-gnueabihf-glibc-headers')
conflicts=('arm-linux-gnueabihf-glibc-headers')

_tarball="arm-gnu-toolchain-${_toolchain_ver}-x86_64-arm-none-linux-gnueabihf"
source=("https://developer.arm.com/-/media/Files/downloads/gnu/${_toolchain_ver}/binrel/${_tarball}.tar.xz")
sha256sums=('1344c620bddc2542f3d83bf8f3655fee4b5d11334fdb0bcce7838ca4ec7f385b')

package() {
    cd "${srcdir}/${_tarball}"

    install -d "${pkgdir}/usr/arm-none-linux-gnueabihf"
    cp -a arm-none-linux-gnueabihf/include "${pkgdir}/usr/arm-none-linux-gnueabihf/"

    install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
