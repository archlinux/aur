# Maintainer: Adam Nielsen <malvineous@shikadi.net>

_intelid=30509
pkgname=intel-mas-cli-tool
pkgver=1.8
pkgrel=1
pkgdesc="Intel Memory and Storage Tool (MAS) supports firmware upgrades and 4Kn sector size changes for PCIe/NVMe/SATA flash/Optane SSDs"
arch=(x86_64)
url="https://downloadcenter.intel.com/download/${_intelid}"
license=()
makedepends=('libarchive')
optdepends=()
source=(https://downloadmirror.intel.com/${_intelid}/eng/Intel%C2%AE_MAS_CLI_Tool_Linux_1.8.zip)
md5sums=('0834aff680ee5cc405baceda0f7a7a25')
sha1sums=('a46c41f45c614cacdf9e2c0dd798800d190a4226')

package() {
	cd "$pkgdir"
	bsdtar -x -f "${srcdir}/intelmas-"*".x86_64.rpm"
	mkdir -p "$pkgdir/usr/share/licenses/"
	mv "$pkgdir/usr/share/intelmas/Licenses" "$pkgdir/usr/share/licenses/${pkgname}/"
}
