# Maintainer: Collide <three-dim-sky@foxmail.com>
# https://github.com/TD-Sky/PKGBUILDs

_target=arm-linux-gnueabihf
_pkgdate=2017.01
_pkgver=4.9

pkgname=${_target}-gcc49-linaro-bin
pkgver=4.9.4
pkgrel=1
pkgdesc="The GNU Compiler Collection- cross compiler for ARMv7 EABI hard float target. (Linaro)"
arch=('x86_64')
url="https://releases.linaro.org/components/toolchain/binaries"
license=('GPL' 'LGPL')
groups=(${_target}-toolchain-linaro-bin)
provides=("${_target}-gcc")
conflicts=("${_target}-gcc")
replaces=("${_target}-gcc")
options=(!emptydirs !strip staticlibs)
source=(${url}/${_pkgver}-${_pkgdate}/${_target}/gcc-linaro-${pkgver}-${_pkgdate}-${arch}_${_target}.tar.xz)
sha256sums=('22914118fd963f953824b58107015c6953b5bbdccbdcf25ad9fd9a2f9f11ac07')

package() {
    mkdir ${pkgdir}/usr
    cp -a ${srcdir}/gcc-linaro-${pkgver}-${_pkgdate}-${arch}_${_target}/* -t ${pkgdir}/usr

    mkdir -p ${pkgdir}/usr/arm-linux-gnueabihf/usr/bin
    mv ${pkgdir}/usr/bin/gdbserver -t ${pkgdir}/usr/arm-linux-gnueabihf/usr/bin

    rm -f  ${pkgdir}/usr/*-manifest.txt
    rm -f  ${pkgdir}/usr/bin/runtest
    rm -f  ${pkgdir}/usr/lib/lib*
    rm -rf ${pkgdir}/usr/include
    rm -rf ${pkgdir}/usr/share/{dejagnu,doc,gcc-*,gdb,info,locale}
    rm -rf ${pkgdir}/usr/share/man/{man1/runtest.1,man5,man7}
}
