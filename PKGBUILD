# Maintainer: hinto.janai <hinto.janai@protonmail.com>
pkgname=monero-vanity-bin
pkgver=0.4.0
pkgrel=2
pkgdesc="Monero Vanity Address Generator GUI/CLI"
arch=('x86_64')
url="https://github.com/hinto-janai/monero-vanity"
license=('custom')
source=("${url}/releases/download/v${pkgver}/monero-vanity-v${pkgver}-linux.tar.gz")
sha256sums=('ba36dbf1e2fb3a1e8f8c31cce73a0b41efe3021020250de4f66348050176f450')
validpgpkeys=('31C5145AAFA5A8DF1C1DB2A6D47CE05FA175A499')

package() {
	# Binary
	install -Dm755 "${srcdir}/monero-vanity-v${pkgver}-linux/monero-vanity" "${pkgdir}/usr/bin/monero-vanity"

	# Icon
	install -Dm644 "${srcdir}/monero-vanity-v${pkgver}-linux/icon.png" "${pkgdir}/usr/share/pixmaps/monero-vanity.png"

	# `.desktop` file.
	install -Dm644 "${srcdir}/monero-vanity-v${pkgver}-linux/monero-vanity.desktop" "${pkgdir}/usr/share/applications/monero-vanity.desktop"
}
