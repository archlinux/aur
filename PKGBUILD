# Maintainer: Carlos Galindo < arch -at- cgj _dot_ es >
# Contributor: Tomáš Mládek <t@mldk.cz>
pkgname=pdfbooklet
pkgver=3.1.6
pkgrel=1
pkgdesc="Utility to convert a PDF into a booklet, reordering pages."
arch=('any')
url="https://pdfbooklet.sourceforge.io"
license=('GPL-3.0-or-later')
depends=("python3"
	 "python-cairo"
	 "poppler-glib"
	 "pango"
	 "python-gobject"
	 "gtk3"
	 "gobject-introspection-runtime")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/TomasResquin/PdfBooklet/archive/v$pkgver.tar.gz")
sha256sums=('98166426890380114b99dd0f4da752b99c6151264f0875de7698149dbf3d0d1f')

build() {
	cd PdfBooklet-$pkgver
	python setup.py build
}

package() {
	cd PdfBooklet-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
