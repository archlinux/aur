# Maintainer: kaypirus <kaypirus@protonmail.com>
pkgname=dgdemux-cli-bin
pkgver=1.0.0.58
pkgrel=1
pkgdesc="Standalone demuxer for BluRay/UHD disks - CLI only"
arch=('x86_64')
url="https://www.rationalqm.us/dgdemux/dgdemux.html"
license=('custom')
source=("${pkgname}-${pkgver}.tar.gz::https://www.rationalqm.us/dgdemux/binaries/dgdemux_linux_${pkgver}.tar.gz")
sha256sums=('e16b4b4fee9275427116d45fa6f995500934e829ecb040daeeb23b0a6dac3260')

prepare() {
	cd "${srcdir}"

	# Extract the license
	grep -o 'Copyright.*$' DGDemux.txt > LICENSE
}

package() {
	cd "${srcdir}"

	# Install the executable
	install -Dm755 dgdemux "${pkgdir}/usr/bin/dgdemux-cli"

	# Install the license
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
