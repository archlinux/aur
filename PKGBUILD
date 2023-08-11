# Maintainer: hinto.janai <hinto.janai@protonmail.com>
pkgname=festival-gui-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Festival music player GUI"
arch=('x86_64')
url="https://github.com/hinto-janai/festival"
license=('MIT')
source=("${url}/releases/download/gui-v${pkgver}/Festival-v${pkgver}-linux-x64.tar.gz")
sha256sums=('0a09ff091db9c00a49ac6d49ce2c29bc7d76a0d25983f3ba3ec0fdbbd7568f13')
validpgpkeys=('31C5145AAFA5A8DF1C1DB2A6D47CE05FA175A499')

package() {
	cd "$srcdir"

	# Binary
	install -Dm755 festival "${pkgdir}/usr/bin/festival"

	# Icon
	install -Dm644 festival.png "${pkgdir}/usr/share/pixmaps/festival.png"

	# FIXME:
	# This is a workaround to lowercase
	# the binary in the `.desktop` file.
	sed -i 's/Exec=Festival/Exec=festival/' festival.desktop

	# `.desktop` file.
	install -Dm644 festival.desktop "${pkgdir}/usr/share/applications/festival.desktop"
}
