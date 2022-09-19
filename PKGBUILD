# Maintainer: taotieren <admin@taotieren.com>

pkgbase=nuclei-gcc
pkgname=(nuclei-gcc nuclei-gcc-bin)
pkgver=2022.08
pkgrel=1
pkgdesc="nuclei-gcc 是 Nuclei Studio IDE 的编译工具。"
arch=("x86_64")
makedepends=()
depends=()
optdepends=('nucleistudioide: Nuclei Studio IDE 是基于 MCU Eclipse IDE 开发的一款针对芯来公司处理器核产品的集成开发环境工具，用于 RISC-V 开发继承了 Eclipse IDE 平台的各种优势。'
			'jlink-software-and-documentation: Segger JLink software & documentation pack for Linux'
			'embedded-studio-risc-v: Segger Embedded Studio for RISC-V')
conflicts=()
url="https://www.nucleisys.com/download.php"
license=('unknow')
options=(!strip)

source=("https://www.nucleisys.com/upload/files/toochain/gcc/nuclei_riscv_newlibc_prebuilt_linux64_${pkgver}.tar.bz2")
sha256sums=('8700b45b61db1b3a316c8ea4503c4640bbfb9018a4c65f604e3ec8aaa3559367')

package_nuclei-gcc() {
	depends=(nuclei-gcc-bin)
}

package_nuclei-gcc-bin() {
	msg2 'Installing Nuclei GCC'
	install -dm755 "${pkgdir}/opt/nuclei/NucleiStudio/toolchain/" \
					"${pkgdir}/opt/SEGGER/Embedded-Studio-RISC-V/Nuclei_Toolchain/"

	mv "${srcdir}/gcc" "${pkgdir}/opt/nuclei"
	ln -sf "/opt/nuclei/gcc" "${pkgdir}/opt/nuclei/NucleiStudio/toolchain/gcc"
	ln -sf "/opt/nuclei/gcc" "${pkgdir}/opt/SEGGER/Embedded-Studio-RISC-V/Nuclei_Toolchain/gcc"
}

#
# makepkg --printsrcinfo > .SRCINFO
#

# vim: set ts=8 sw=8 tw=0 noet:
