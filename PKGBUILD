# Maintainer: Carlos Galindo < arch -at- cgj _dot_ es >
# Contributor: Tomáš Mládek <t@mldk.cz>
pkgname=pdfbooklet
pkgver=3.1.7
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
sha256sums=('078aa5848149e3b6f35d1af8489b3e34c5da656dea70a0bec9ad63945823dd64')

build() {
	cd PdfBooklet-$pkgver
	python setup.py build
}

package() {
	cd PdfBooklet-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
