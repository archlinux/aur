# Maintainer: Adam Nielsen <malvineous@shikadi.net>

# Support for legacy devices was removed in version 2.0.  The previous version
# is available in the intel-mas-cli-tool-v1.x package.

pkgname=intel-mas-cli-tool
pkgver=2.0
pkgrel=1
pkgdesc="Intel Memory and Storage Tool (MAS) supports firmware upgrades and 4Kn sector size changes for PCIe/NVMe/SATA flash/Optane SSDs"
arch=(x86_64)
url="https://www.intel.com/content/www/us/en/download/19520/"
license=()
makedepends=('libarchive')
optdepends=()
conflicts=('intel-mas-cli-tool-v1.x')
source=(https://downloadmirror.intel.com/690882/Intel_MAS_CLI_Tool_Linux_2.0.zip)
md5sums=('772fda07692ff0c33252ffd338714c2c')
sha1sums=('0d456648eaa2756feac1dd3bb447371b912201bf')

package() {
	cd "$pkgdir"
	bsdtar -x -f "${srcdir}/intelmas-"*".x86_64.rpm"
	mkdir -p "$pkgdir/usr/share/licenses/"
	mv "$pkgdir/usr/share/doc/intelmas" "$pkgdir/usr/share/licenses/${pkgname}"
	rmdir "$pkgdir/usr/share/doc"
}
