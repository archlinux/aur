# Contributor: Joel Schaerer <joel.schaerer@laposte.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=textext
_pkgname=TexText
pkgver=1.1.0
pkgrel=1
pkgdesc="An inkscape extension which lets you add LaTeX equations to your drawings"
arch=('any')
license=('custom:BSD')
url="https://github.com/textext/textext"
makedepends=('python')
depends=('inkscape=1.0' 'texlive-core' 'python' 'pdf2svg' 'python-lxml' 'python-gobject')
optdepends=('imagemagick')
source=("$pkgname-$pkgver.tar.gz::https://github.com/textext/textext/releases/download/$pkgver/${_pkgname}-Linux-$pkgver.tar.gz")

sha256sums=('1baa6cacb27f50b1316290e45021a8302795154d8b95a5903de320792e351fea')

package()
{
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py --inkscape-extensions-path="$pkgdir/usr/share/inkscape/extensions/"
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	rm -rf "$pkgdir/usr/share/inkscape/extensions/textext/__pycache__"
}
