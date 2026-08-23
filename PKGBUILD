# Maintainer: Dominik Kummer <admin@arkades.org>

pkgname=nuttx
pkgver=13.0.0
pkgrel=1
pkgdesc='Apache NuttX RTOS development source tree with integrated applications'
arch=('any')
url='https://nuttx.apache.org/'
license=('Apache-2.0')

depends=(
    'bison'
    'flex'
    'gettext'
    'texinfo'
    'ncurses'
    'gperf'
    'automake'
    'libtool'
    'pkgconf'
    'gmp'
    'libmpc'
    'mpfr'
    'libisl'
    'elfutils'
    'expat'
    'picocom'
    'uboot-tools'
    'util-linux'
    'vim'
    'genromfs'
    'python-kconfiglib'
    'kconfig-frontends-git'
)

optdepends=(
    'aarch64-linux-gnu-gcc: AArch64 Linux cross compiler'
    'arm-none-eabi-gcc: ARM bare-metal cross compiler'
    'lm32-elf-gcc: LatticeMico32 cross compiler'
    'nds32le-elf-gcc: Andes NDS32 little-endian cross compiler'
    'or1k-elf-gcc: OpenRISC cross compiler'
    'riscv64-elf-gcc: RISC-V 64-bit bare-metal cross compiler'
    'riscv64-linux-gnu-gcc: RISC-V 64-bit Linux cross compiler'
)

source=(
    "https://www.apache.org/dyn/closer.lua/nuttx/${pkgver}/apache-nuttx-${pkgver}.tar.gz?action=download"
    "https://www.apache.org/dyn/closer.lua/nuttx/${pkgver}/apache-nuttx-apps-${pkgver}.tar.gz?action=download"
)

sha512sums=('104263f050810455b6c14ad92f045e367ad07718840d5f7464e8dddcc7304dd077f3c8847f4ab21a34ed2c971c4d9b1a51413a8e1f1683d144439e0aa40279f0'
            'd1bcb7cd1e9b769e73bdf7dcacfcc23c5108c9b5a8c9712b2bc5a3123f7bd501aeef782fbdab06f65e0a8290a2a9dfb86c5a97759e93fad471a71fd25ef6366e')


package() {
    install -dm755 "${pkgdir}/usr/share/nuttx"

    cp -a nuttx/. "${pkgdir}/usr/share/nuttx/"
    cp -a apps "${pkgdir}/usr/share/nuttx/apps"
}
