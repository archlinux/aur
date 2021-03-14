# Maintainer: Adam Nielsen <malvineous@shikadi.net>

_intelid=30259
pkgname=intel-mas-cli-tool
pkgver=1.6
pkgrel=1
pkgdesc="Intel Memory and Storage Tool (MAS) supports firmware upgrades and 4Kn sector size changes for PCIe/NVMe/SATA flash/Optane SSDs"
arch=(x86_64)
url="https://downloadcenter.intel.com/download/${_intelid}"
license=()
makedepends=('libarchive')
optdepends=()
source=(https://downloadmirror.intel.com/${_intelid}/eng/Intel%C2%AE_MAS_CLI_Tool_Linux_1.6.zip)
md5sums=('af5584242fe37ff97d459ec6553868b7')
sha1sums=('72053de02ce37d58b7ffcb99995038de7808ecbb')

package() {
	cd "$pkgdir"
	bsdtar -x -f "${srcdir}/intelmas-"*".x86_64.rpm"
	mkdir -p "$pkgdir/usr/share/licenses/"
	mv "$pkgdir/etc/Licenses" "$pkgdir/usr/share/licenses/${pkgname}/"
	rmdir --ignore-fail-on-non-empty "$pkgdir/etc"
}
