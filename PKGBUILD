# Maintainer: Nicolas Derumigny <nderumigny@gmail.com>

_target=riscv32-corev-elf
_pkgname=${_target}-gcc
pkgname=${_pkgname}-bin
pkgver=14.1.0
pkgrel=20240530
pkgdesc='Cross compiler for 32-bit RISC-V (Open Hardware Group CV32E40Pv2 project)'
arch=('x86_64')
url='https://embecosm.com/downloads/tool-chain-downloads/#core-v-top-of-tree-compilers'
license=('GPL' 'LGPL')
provides=("${_target}-gdb" "${_target}-binutils" "${_target}-newlib")
options=('!emptydirs' '!strip')
source=("https://buildbot.embecosm.com/job/corev-gcc-centos7/48/artifact/corev-openhw-gcc-centos7-${pkgrel}.tar.gz")
sha256sums=('e4afdff4d17a0b060fc366cbb1be99ae726c6bd79f00da7dfb164d89c1a29352')

package() {
  install -dm755 ${pkgdir}/opt/riscv/${_pkgname}

  cp -a ${srcdir}/corev-openhw-gcc-centos7-${pkgrel}/* ${pkgdir}/opt/riscv/${_pkgname}/
}

