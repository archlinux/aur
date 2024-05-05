# Maintainer: Adam Nielsen <malvineous@shikadi.net>

# Support for legacy devices was removed in version 2.0.  The previous version
# is available in the intel-mas-cli-tool-v1.x package.

pkgname=intel-mas-cli-tool
pkgver=2.5
pkgrel=1
pkgdesc="A drive management CLI tool for Intel Optane SSDs and Intel Optane Memory devices"
arch=(x86_64)
url="https://www.intel.com/content/www/us/en/download/19520/"
license=()
makedepends=('libarchive')
optdepends=()
conflicts=('intel-mas-cli-tool-v1.x')
source=(https://downloadmirror.intel.com/822151/Intel_MAS_CLI_Tool_Linux_2.5.zip)
md5sums=('a259ae5dbf002348001a1eb1b1314aab')
sha1sums=('1a4b2f4389689bf30e106f0d67fd99acdc65fcc7')

package() {
	cd "$pkgdir"
	bsdtar -x -f "${srcdir}/intelmas-"*".x86_64.rpm"
	mkdir -p "$pkgdir/usr/share/licenses/"
	mv "$pkgdir/usr/share/doc/intelmas" "$pkgdir/usr/share/licenses/${pkgname}"
	rmdir "$pkgdir/usr/share/doc"
}
