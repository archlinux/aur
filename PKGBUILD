# Contributor: Joel Schaerer <joel.schaerer@laposte.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=textext
_pkgname=TexText
pkgver=1.8.1
pkgrel=1
pkgdesc="An inkscape extension which lets you add LaTeX equations to your drawings"
arch=('any')
license=('custom:BSD')
url="https://github.com/textext/textext"
makedepends=('python')
depends=('inkscape>=1.0' 'texlive-core' 'python' 'pdf2svg' 'python-lxml' 'python-gobject' 'python-cssselect')
optdepends=('imagemagick')
source=("$pkgname-$pkgver.tar.gz::https://github.com/textext/textext/releases/download/$pkgver/${_pkgname}-Linux-$pkgver.tar.gz")

sha256sums=('34c489bd22985731d836a82b379d2948be13e40c860782ec6a4ea765a52f744b')

package()
{
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py --inkscape-extensions-path="$pkgdir/usr/share/inkscape/extensions/"
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install "$pkgdir/usr/share/inkscape/extensions/textext/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	rm -rf "$pkgdir/usr/share/inkscape/extensions/textext/__pycache__"
}
