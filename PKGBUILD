# Maintainer: kaypirus <kaypirus@protonmail.com>
pkgname=dgdemux
pkgver=1.0.0.78
pkgrel=1
pkgdesc="Standalone demuxer for BluRay/UHD disks - CLI only"
arch=('x86_64')
url="https://www.rationalqm.us/dgdemux/dgdemux.html"
license=('custom')
source=("${pkgname}-${pkgver}.zip::https://www.rationalqm.us/dgdemux/binaries/dgdemux_linux_${pkgver}.zip")
sha256sums=('05e1f44226d112d20b0ab4b76283e7eb52e3c7c43f94288a42415f50c2c84da4')

prepare() {
	cd "${srcdir}"

	# Extract license
	grep -o 'Copyright.*$' DGDemux.txt > LICENSE
}

package() {
	cd "${srcdir}"

	# Install dgdemux
	install -Dm755 dgdemux "${pkgdir}/usr/local/bin/dgdemux"

	# Install dovi_tool
	install -Dm755 dovi_tool "${pkgdir}/usr/local/bin/dovi_tool"

	# Install dgmvccombine
	install -Dm755 dgmvccombine "${pkgdir}/usr/local/bin/dgmvccombine"

	# Install help
	install -Dm755 DGDemux.txt "${pkgdir}/usr/local/bin/DGDemux.txt"

	# Install license
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
