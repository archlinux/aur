# Maintainer: taotieren <admin@taotieren.com>

pkgbase=nuclei-qemu
pkgname=(nuclei-qemu)
pkgver=2025.02
pkgrel=2
pkgdesc="nuclei-qemu 是 Nuclei Studio IDE 的仿真工具。"
arch=("x86_64")
makedepends=()
depends=()
optdepends=('nucleistudioide: Nuclei Studio IDE 是基于 MCU Eclipse IDE 开发的一款针对芯来公司处理器核产品的集成开发环境工具，用于 RISC-V 开发继承了 Eclipse IDE 平台的各种优势。'
	'jlink-software-and-documentation: Segger JLink software & documentation pack for Linux')
conflicts=()
url="https://www.nucleisys.com/download.php"
license=('LicenseRef-unknow')
options=(!strip !debug)
source=("https://download.nucleisys.com/upload/files/toochain/qemu/nuclei-qemu-${pkgver}-linux-x64.tar.gz")
sha256sums=('8706fdd45f542cf6a1d6261a8121868010832d023af8946e75da5e2ac4406d2b')

package_nuclei-qemu-bin() {
	msg2 'Installing Nuclei QEMU'
	install -dm755 "${pkgdir}/opt/nuclei/NucleiStudio/toolchain/"

	mv "${srcdir}/qemu" "${pkgdir}/opt/nuclei/qemu"
	ln -sf "/opt/nuclei/qemu" "${pkgdir}/opt/nuclei/NucleiStudio/toolchain/qemu"
}

#
# makepkg --printsrcinfo > .SRCINFO
#

# vim: set ts=8 sw=8 tw=0 noet:
