# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=libreoffice-extension-writingtool-bin
pkgver=26.7
pkgrel=1
pkgdesc="WritingTool is a LibreOffice extension for LibreOffice that adds a writing assistant to text editing."
arch=('any')
url="https://writingtool.org/index.php/en/"
license=('LGPL-2.1-only')
groups=('libreoffice-extensions')
depends=('java-runtime>=17' 'libreoffice' 'python' 'perl' 'bash')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("https://writingtool.org/writingtool/releases/WritingTool-${pkgver}.oxt")
noextract=("WritingTool-${pkgver}.oxt")
sha256sums=('529a3ec9921e11bd7d1fc0b409bdb329d495cecb52e587f97e838b2c42f9fb42')

package() {
	cd "$srcdir"
	install -dm755 "$pkgdir/usr/lib/libreoffice/share/extensions/writingtool"
	bsdtar -xf WritingTool-${pkgver}.oxt -C "$pkgdir/usr/lib/libreoffice/share/extensions/writingtool"
}
