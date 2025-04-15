# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=libreoffice-extension-writingtool
pkgver=1.2
pkgrel=1
pkgdesc="WritingTool is a LibreOffice extension for LibreOffice that adds a writing assistant to text editing."
arch=('any')
url="https://writingtool.org/index.php/en/"
license=('LGPL-2.1-only')
groups=('libreoffice-extensions')
depends=('java-runtime=17' 'libreoffice' 'python' 'perl' 'bash')
source=("https://github.com/writingtool-org/writingtool/releases/download/v${pkgver}/WritingTool-${pkgver}.oxt")
noextract=("WritingTool-${pkgver}.oxt")
sha256sums=('c807031702c4c87beb17d1ffe17c12027d462dd499c6d80349cd69d6c2d11ef8')

package() {
	cd "$srcdir"
	install -dm755 "$pkgdir/usr/lib/libreoffice/share/extensions/writingtool"
	bsdtar -xf WritingTool-${pkgver}.oxt -C "$pkgdir/usr/lib/libreoffice/share/extensions/writingtool"
}
