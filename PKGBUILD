# Maintainer: Adam Nielsen <malvineous@shikadi.net>

_intelid=30059
pkgname=intel-mas-cli-tool
pkgver=1.4
pkgrel=2
pkgdesc="Intel Memory and Storage Tool (MAS) supports firmware upgrades and 4Kn sector size changes for PCIe/NVMe/SATA flash/Optane SSDs"
arch=(x86_64)
url="https://downloadcenter.intel.com/download/${_intelid}"
license=()
makedepends=('libarchive')
optdepends=()
source=(https://downloadmirror.intel.com/${_intelid}/eng/Intel%C2%AE_MAS_CLI_Tool_Linux.zip)
md5sums=('1873393967166f89e1b10560aa859d47')
sha1sums=('4dd3edd4f99ed52f9046b7bb0a13755d6d13badf')

package() {
	cd "$pkgdir"
	bsdtar -x -f "${srcdir}/intelmas-"*".x86_64.rpm"
	mkdir -p "$pkgdir/usr/share/licenses/"
	mv "$pkgdir/etc/Licenses" "$pkgdir/usr/share/licenses/${pkgname}/"
	rmdir --ignore-fail-on-non-empty "$pkgdir/etc"
}
