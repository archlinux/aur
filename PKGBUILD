# Maintainer: Adam Nielsen <malvineous@shikadi.net>

_intelid=29721
pkgname=intel-mas-cli-tool
pkgver=1.1
pkgrel=1
pkgdesc="Intel Memory and Storage Tool (MAS) supports firmware upgrades and 4Kn sector size changes for PCIe/NVMe/SATA flash/Optane SSDs"
arch=(any)
url="https://downloadcenter.intel.com/download/${_intelid}"
license=()
makedepends=('libarchive')
optdepends=()
source=(https://downloadmirror.intel.com/${_intelid}/eng/Intel%C2%AE_MAS_CLI_Tool_${pkgver}_Linux.zip)
md5sums=('f064ccbe0783b50990c5f23b9c2057b3')
sha1sums=('5961af165e43e7a842311fba5434a8b3b7a420c7')

package() {
	cd "$pkgdir"
	bsdtar -x -f "${srcdir}/intelmas-"*".x86_64.rpm"
	mkdir -p "$pkgdir/usr/share/licenses/"
	mv "$pkgdir/etc/Licenses" "$pkgdir/usr/share/licenses/${pkgname}/"
	rmdir --ignore-fail-on-non-empty "$pkgdir/etc"
}
