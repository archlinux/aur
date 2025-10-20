# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=libreoffice-extension-writingtool-bin
pkgver=25.10
pkgrel=1
pkgdesc="WritingTool is a LibreOffice extension for LibreOffice that adds a writing assistant to text editing."
arch=('any')
url="https://writingtool.org/index.php/en/"
license=('LGPL-2.1-only')
groups=('libreoffice-extensions')
depends=('java-runtime>=17' 'libreoffice' 'python' 'perl' 'bash')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("https://github.com/writingtool-org/writingtool/releases/download/v${pkgver}/WritingTool-${pkgver}.oxt")
noextract=("WritingTool-${pkgver}.oxt")
sha256sums=('cf164d9cc083b49833ca68e29abb99ba41ab064e447dd48dd253e611aeadb739')

package() {
	cd "$srcdir"
	install -dm755 "$pkgdir/usr/lib/libreoffice/share/extensions/writingtool"
	bsdtar -xf WritingTool-${pkgver}.oxt -C "$pkgdir/usr/lib/libreoffice/share/extensions/writingtool"
}
