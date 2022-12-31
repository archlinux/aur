# Maintainer: HaoCheng<ch1994@outlook.com>
pkgname=stream-url-bin
_pkgname=stream-url
pkgver=0.2.1
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


sha256sums=('2239a38786b9429cc41539f3fe7972b09cbbaa538250d53c2fdcc01e0b6172be')
sha256sums_aarch64=('505e662502962243132646faefda0c78dd3f15523559f8d8c7f54009fd3c3d7a')
sha256sums_x86_64=('727be37756f0d838d6dddff1d85a87fc8522af4963f39eac4c634df9018ec987')

package() {
	cd ${srcdir}
	install -D -m755 cli "${pkgdir}/usr/bin/${_pkgname}-cli" 
	install -D -m755 server "${pkgdir}/usr/bin/${_pkgname}-server" 
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
