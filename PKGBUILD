# Maintainer: Adam Nielsen <malvineous@shikadi.net>

_intelid=29917
pkgname=intel-mas-cli-tool
pkgver=1.3
pkgrel=1
pkgdesc="Intel Memory and Storage Tool (MAS) supports firmware upgrades and 4Kn sector size changes for PCIe/NVMe/SATA flash/Optane SSDs"
arch=(any)
url="https://downloadcenter.intel.com/download/${_intelid}"
license=()
makedepends=('libarchive')
optdepends=()
source=(https://downloadmirror.intel.com/${_intelid}/eng/Intel%C2%AE_MAS_CLI_Tool_${pkgver}_Linux.zip)
md5sums=('3a632028cb23fed5c161d27c9b4e5d73')
sha1sums=('f4d5bd58c6f144094304e4fb4790fd5c53e61fdb')

package() {
	cd "$pkgdir"
	bsdtar -x -f "${srcdir}/intelmas-"*".x86_64.rpm"
	mkdir -p "$pkgdir/usr/share/licenses/"
	mv "$pkgdir/etc/Licenses" "$pkgdir/usr/share/licenses/${pkgname}/"
	rmdir --ignore-fail-on-non-empty "$pkgdir/etc"
}
