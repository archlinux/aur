# Maintainer: taotieren <admin@taotieren.com>

pkgname=nuclei-openocd
pkgver=0.10.0
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

source=("https://www.nucleisys.com/upload/files/toochain/openocd/nuclei-openocd-${pkgver}-15-linux-x64.tgz")
sha256sums=('636E48FFBA7AB4B63F28F36DB2549C09FB04CD2F876E450B8C3E39AF4E5B983F')

package() {
	cd "$srcdir"

	msg2 'Installing Nuclei OpenOCD'
	install -dm755 "${pkgdir}/opt/nuclei/NucleiStudio/toolchain"

	tar zxf "nuclei-openocd-${pkgver}-15-linux-x64.tgz"

	mv "Nuclei/openocd" "${pkgdir}/opt/nuclei"
	ln -sf "/opt/nuclei/openocd/0.10.0-15" "${pkgdir}/opt/nuclei/NucleiStudio/toolchain/openocd"
}

#
# makepkg --printsrcinfo > .SRCINFO
#

# vim: set ts=8 sw=8 tw=0 noet:
