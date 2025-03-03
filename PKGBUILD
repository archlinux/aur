# Maintainer: taotieren <admin@taotieren.com>

pkgbase=xlmodel-bin
pkgname=(xlmodel-bin)
pkgver=2025.02
pkgrel=0
pkgdesc="Nuclei Near Cycle Model "
arch=("x86_64")
makedepends=()
depends=(
	gcc-libs
	glibc
)
optdepends=(
	'nucleistudioide: Nuclei Studio IDE 是基于 MCU Eclipse IDE 开发的一款针对芯来公司处理器核产品的集成开发环境工具，用于 RISC-V 开发继承了 Eclipse IDE 平台的各种优势。'
	'jlink-software-and-documentation: Segger JLink software & documentation pack for Linux'
	'embedded-studio-risc-v: Segger Embedded Studio for RISC-V'
	'cmake: A cross-platform open-source make system'
)
conflicts=()
url="https://www.nucleisys.com/download.php"
license=('LicenseRef-unknow')
options=(!strip !debug)
install=${pkgname}.install
# https://download.nucleisys.com/upload/files/toolchain/xlmodel/xlmodel-linux64-2025.02.tar.gz
source=(
	"https://download.nucleisys.com/upload/files/toolchain/xlmodel/xlmodel-linux64-${pkgver}.tar.gz"
	"${pkgname}.install")
sha256sums=('dc064dea12ecd6a46ebb9a55eceb4c4bb1c6e34691aa9ccab5512a5b33e3293c'
            '3600d561847139d844754676cdb1870243fcda126f9d9d98e65b78ef237bcca6')

package() {
	install -dm755 "${pkgdir}/opt/nuclei/xlmodel/" \
		"${pkgdir}/usr/bin"

	mv "${srcdir}"/xlmodel/{tests,README.md} "${pkgdir}/opt/nuclei/xlmodel/"
	install -vDm755 "${srcdir}/xlmodel/bin/xl_cpumodel" -t "${pkgdir}/usr/bin"
}

#
# makepkg --printsrcinfo > .SRCINFO
#

# vim: set ts=8 sw=8 tw=0 noet:
