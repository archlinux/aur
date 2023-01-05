# Maintainer: HaoCheng<ch1994@outlook.com>
pkgname=stream-url-bin
_pkgname=stream-url
pkgver=0.2.7
pkgrel=1
pkgdesc="A command line tool to get stream urls written in rust."
arch=('aarch64' 'x86_64')
url="https://github.com/tkit1994/stream-url"
license=('MIT')
provides=('stream-url')
depends=('gcc-libs')
source=("https://raw.githubusercontent.com/tkit1994/${_pkgname}/v${pkgver}/LICENSE")
source_aarch64=("https://github.com/tkit1994/stream-url/releases/download/v${pkgver}/stream-url-v${pkgver}.aarch64-unknown-linux-gnu.tar.gz")
source_x86_64=("https://github.com/tkit1994/stream-url/releases/download/v${pkgver}/stream-url-v${pkgver}.x86_64-unknown-linux-gnu.tar.gz")


sha256sums=('5d733fd59ba3db2ef7350a9f2e2551982614720ad557da02657102c22d3b9f0e')
sha256sums_aarch64=('914be6b66d956f325681bab35f3fb9094f39e302e62a4f22bc6309b05d2c0972')
sha256sums_x86_64=('395fcbe48c95059ac39f117196119969b95f35357f08523b602d256be331411b')

package() {
	cd ${srcdir}
	install -D -m755 cli "${pkgdir}/usr/bin/${_pkgname}-cli"
	install -D -m755 server "${pkgdir}/usr/bin/${_pkgname}-server"
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
