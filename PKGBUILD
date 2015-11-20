# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Daniel Reuter <daniel.robin.reuter@googlemail.com>
pkgname=ocrmypdf
pkgver=3.0
pkgrel=1
pkgdesc="OCRmyPDF adds an OCR text layer to scanned PDF files, allowing them to be searched."
url="https://github.com/jbarlow83/OCRmyPDF"
arch=('any')
license=('custom')
depends=('python' 'python-pillow>=2.4.0' 'python-pypdf2>=1.25.1'
         'python-reportlab>=3.1.44' 'python-ruffus>=2.6.3' 'ghostscript>=9.14'
         'qpdf>=5.0.0' 'tesseract>=3.02.02' 'unpaper>=6.1')
source=("https://github.com/jbarlow83/OCRmyPDF/archive/v${pkgver}.tar.gz")
sha256sums=('593b3f31779fdae6f75faf67cf6a3c7e2da632b18b64c866e566a145241e0b87')

package() {
  cd "${srcdir}/OCRmyPDF-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.rst $pkgdir/usr/share/licenses/$pkgname/LICENSE.rst
}

# vim:set ts=2 sw=2 et:
