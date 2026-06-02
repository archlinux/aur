# Maintainer: Yichuan Gao <aur@gycis.me>

pkgname=hpmicro-riscv-gnu-toolchain-bin
pkgver=2023.10.18
pkgrel=1
pkgdesc="HPMicro prebuilt riscv32-unknown-elf GNU toolchain (rv32imac_zicsr_zifencei multilib + B extension)"
arch=('x86_64')
url="https://github.com/hpmicro/riscv-gnu-toolchain"
license=('GPL-3.0-or-later')
provides=('hpmicro-riscv-gnu-toolchain')
conflicts=('hpmicro-riscv-gnu-toolchain')
# Prebuilt binaries: keep them as shipped.
options=('!strip' 'staticlibs' '!debug')
_srcname="rv32imac_zicsr_zifencei_multilib_b_ext-linux"
_prefix="/opt/hpmicro/riscv-gnu-toolchain"
source=("${_srcname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${_srcname}.tar.gz")
sha256sums=('550e867c86d14e0a1fddfde4d9316f7485a396474311c5d8ab61ebff5492ce17')

package() {
    install -d "${pkgdir}${_prefix}"
    cp -a "${srcdir}/${_srcname}/." "${pkgdir}${_prefix}/"
}
