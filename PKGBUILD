# Maintainer: hinto.janai <hinto.janai@protonmail.com>
pkgname=festival-gui-bin
pkgver=0.0.0
pkgrel=7
pkgdesc="Festival music player GUI"
arch=('x86_64')
url="https://github.com/hinto-janai/festival"
license=('MIT')
source=("${url}/releases/download/v${pkgver}/Festival-v${pkgver}-linux-x64.tar.gz")
sha256sums=('59079e158efce05104392d0dfb129c653d0be9129c60307ff88dfa7e762bdfc2')
validpgpkeys=('31C5145AAFA5A8DF1C1DB2A6D47CE05FA175A499')

package() {
	base="${srcdir}/festival"

	# Binary
	install -Dm755 "${base}" "${pkgdir}/usr/bin/"

	# Icon
	install -Dm644 "${base}.png" "${pkgdir}/usr/share/pixmaps/"

	# `.desktop` file.
	install -Dm644 "${base}.desktop" "${pkgdir}/usr/share/applications/"
}
