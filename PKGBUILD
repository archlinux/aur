# Maintainer: HaoCheng<ch1994@outlook.com>
pkgname=stream-url-bin
_pkgname=stream-url
pkgver=0.2.13
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
sha256sums_aarch64=('0af15aafefc5d0bb6689460876cb1fa00282a39ec81447c59c39e93d4bf2e549')
sha256sums_x86_64=('0b9a576af6fc7e4c046b7b67120eac190d1fd545da8e343293580622b3b389ae')

package() {
	cd ${srcdir}
	install -D -m755 cli "${pkgdir}/usr/bin/${_pkgname}-cli"
	install -D -m755 server "${pkgdir}/usr/bin/${_pkgname}-server"
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
