# Maintainer: Adam Nielsen <malvineous@shikadi.net>

# Support for legacy devices was removed in version 2.0.  The previous version
# is available in the intel-mas-cli-tool-v1.x package.

pkgname=intel-mas-cli-tool
pkgver=2.3
pkgrel=1
pkgdesc="A drive management CLI tool for Intel Optane SSDs and Intel Optane Memory devices"
arch=(x86_64)
url="https://www.intel.com/content/www/us/en/download/19520/"
license=()
makedepends=('libarchive')
optdepends=()
conflicts=('intel-mas-cli-tool-v1.x')
source=(https://downloadmirror.intel.com/794735/Intel_MAS_CLI_Tool_Linux_2.3.zip)
md5sums=('e2ba538a05a277587d745a3851a87192')
sha1sums=('6a5ccecafb4756fcde8271bebbea69d336970fb6')

package() {
	cd "$pkgdir"
	bsdtar -x -f "${srcdir}/intelmas-"*".x86_64.rpm"
	mkdir -p "$pkgdir/usr/share/licenses/"
	mv "$pkgdir/usr/share/doc/intelmas" "$pkgdir/usr/share/licenses/${pkgname}"
	rmdir "$pkgdir/usr/share/doc"
}
