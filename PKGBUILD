# Maintainer: Adam Nielsen <malvineous@shikadi.net>

_intelid=30556
pkgname=intel-mas-cli-tool
pkgver=1.9
pkgrel=1
pkgdesc="Intel Memory and Storage Tool (MAS) supports firmware upgrades and 4Kn sector size changes for PCIe/NVMe/SATA flash/Optane SSDs"
arch=(x86_64)
url="https://downloadcenter.intel.com/download/${_intelid}"
license=()
makedepends=('libarchive')
optdepends=()
source=(https://downloadmirror.intel.com/${_intelid}/eng/Intel%C2%AE_MAS_CLI_Tool_Linux_1.9.zip)
md5sums=('aade0f645d282f83a58f31d26c039428')
sha1sums=('9dfcb57c88a93b48b1f2a16507b15ed69207cd3e')

package() {
	cd "$pkgdir"
	bsdtar -x -f "${srcdir}/intelmas-"*".x86_64.rpm"
	mkdir -p "$pkgdir/usr/share/licenses/"
	mv "$pkgdir/usr/share/intelmas/Licenses" "$pkgdir/usr/share/licenses/${pkgname}/"
}
