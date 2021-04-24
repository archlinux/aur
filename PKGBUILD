# Maintainer: Adam Nielsen <malvineous@shikadi.net>

_intelid=30379
pkgname=intel-mas-cli-tool
pkgver=1.7
pkgrel=1
pkgdesc="Intel Memory and Storage Tool (MAS) supports firmware upgrades and 4Kn sector size changes for PCIe/NVMe/SATA flash/Optane SSDs"
arch=(x86_64)
url="https://downloadcenter.intel.com/download/${_intelid}"
license=()
makedepends=('libarchive')
optdepends=()
source=(https://downloadmirror.intel.com/${_intelid}/eng/Intel%C2%AE_MAS_CLI_Tool_Linux_1.7.zip)
md5sums=('c07beb6b400ae2bf583c5b9fdbbb1bd3')
sha1sums=('d8ed2f1de91e18c9fb3f9e53043a5f82b687da3a')

package() {
	cd "$pkgdir"
	bsdtar -x -f "${srcdir}/intelmas-"*".x86_64.rpm"
	mkdir -p "$pkgdir/usr/share/licenses/"
	mv "$pkgdir/etc/Licenses" "$pkgdir/usr/share/licenses/${pkgname}/"
	rmdir --ignore-fail-on-non-empty "$pkgdir/etc"
}
