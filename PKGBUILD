# Maintainer: taotieren <admin@taotieren.com>

pkgname=nuclei-openocd
pkgver=2022.01
pkgrel=1
pkgdesc="nuclei-openocd 是 Nuclei Studio IDE 的调试工具。"
arch=("x86_64")
makedepends=()
depends=()
optdepends=()
conflicts=()
url="https://www.nucleisys.com/download.php"
license=('unknow')
options=(!strip)

source=("https://www.nucleisys.com/upload/files/toochain/openocd/nuclei-openocd-${pkgver}-linux-x64.tgz")
sha256sums=('0c55a43a09bf6f75959fab44fcec6f785ed9c1a40f62d746089c654ea3409074')

package() {
	cd "$srcdir"

	msg2 'Installing Nuclei OpenOCD'
	install -dm755 "${pkgdir}/opt/nuclei/NucleiStudio/toolchain"

	tar zxf "nuclei-openocd-${pkgver}-linux-x64.tgz"

	mv "Nuclei/openocd" "${pkgdir}/opt/nuclei"
	ln -sf "/opt/nuclei/openocd/${pkgver}" "${pkgdir}/opt/nuclei/NucleiStudio/toolchain/openocd"
}

#
# makepkg --printsrcinfo > .SRCINFO
#

# vim: set ts=8 sw=8 tw=0 noet:
