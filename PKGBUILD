# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=libreoffice-extension-writingtool-bin
pkgver=26.1
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
sha256sums=('64c31cf1fc1623fd10db5b00a959303643d91c622f729e913f128701ebef745b')

package() {
	cd "$srcdir"
	install -dm755 "$pkgdir/usr/lib/libreoffice/share/extensions/writingtool"
	bsdtar -xf WritingTool-${pkgver}.oxt -C "$pkgdir/usr/lib/libreoffice/share/extensions/writingtool"
}
