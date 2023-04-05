# Maintainer: hinto.janai <hinto.janai@protonmail.com>
pkgname=monero-vanity-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Monero Vanity Address Generator GUI/CLI"
arch=('x86_64')
url="https://github.com/hinto-janai/monero-vanity"
license=('custom')
source=("${url}/releases/download/v${pkgver}/monero-vanity-v${pkgver}-linux.tar.gz")
sha256sums=('6ecc453a71579cb071ca0ec5444b3962d99b49d3ca866d6c3afbe2a786e896a2')
validpgpkeys=('31C5145AAFA5A8DF1C1DB2A6D47CE05FA175A499')

package() {
	# Binary
	install -Dm755 "${srcdir}/monero-vanity-v${pkgver}-linux/monero-vanity" "${pkgdir}/usr/bin/monero-vanity"

	# Icon
	install -Dm644 "${srcdir}/monero-vanity-v${pkgver}-linux/icon.png" "${pkgdir}/usr/share/pixmaps/monero-vanity.png"

	# `.desktop` file.
	install -Dm644 "${srcdir}/monero-vanity-v${pkgver}-linux/monero-vanity.desktop" "${pkgdir}/usr/share/applications/monero-vanity.desktop"
}
