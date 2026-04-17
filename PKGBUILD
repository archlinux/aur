# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=libreoffice-extension-writingtool-bin
pkgver=26.4
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
sha256sums=('ae7996c37617513b289c9cb3bcbc07ab8eac3b9e816ee20f5117623e8f9c6904')

package() {
	cd "$srcdir"
	install -dm755 "$pkgdir/usr/lib/libreoffice/share/extensions/writingtool"
	bsdtar -xf WritingTool-${pkgver}.oxt -C "$pkgdir/usr/lib/libreoffice/share/extensions/writingtool"
}
