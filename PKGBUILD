# Maintainer: Tomáš Mládek <t@mldk.cz>
pkgname=pdfbooklet
pkgver=3.1.2
pkgrel=2
pkgdesc="pdfbooklet"
arch=('any')
url="https://pdfbooklet.sourceforge.io"
license=('GPL-3.0')
depends=('python3')
source=("https://sourceforge.net/projects/pdfbooklet/files/pdfbooklet%20$pkgver/$pkgname-$pkgver-all_64.tar.gz")
sha256sums=("f6171f34d2c7e922c5f1c9d03dec28e4ab706c1062ff39356e9f67be49e25ace")

package() {
	mkdir -p $pkgdir/usr
	cp -r $srcdir/usr/bin $pkgdir/usr/bin
	cp -r $srcdir/usr/share $pkgdir/usr/share

	PYTHONDIR="$(python3 -c 'import sys; print(sys.path[-1])')"
	mkdir -p $pkgdir$PYTHONDIR
	cp -r $srcdir/usr/lib/python3/dist-packages/* -t $pkgdir$PYTHONDIR
}
