# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Daniel Reuter <daniel.robin.reuter@googlemail.com>
pkgname=ocrmypdf
pkgver=4.0.7
pkgrel=1
pkgdesc="A tool to add an OCR text layer to scanned PDF files, allowing them to be searched"
url="https://github.com/jbarlow83/OCRmyPDF"
arch=('any')
license=('custom')
depends=('python' 'python-cffi>=1.5.2' 'python-pillow>=2.4.0'
         'python-pypdf2>=1.25.1' 'python-reportlab>=3.2.0'
         'python-ruffus>=2.6.3' 'ghostscript>=9.14' 'qpdf>=5.0.0'
         'tesseract>=3.02.02' 'unpaper>=6.1' 'python-img2pdf>=0.2')
source=("https://pypi.python.org/packages/source/o/ocrmypdf/ocrmypdf-${pkgver}.tar.gz")
sha256sums=('7f34352a2dd4f0cd9bf543bdfbb6cb06adfae77ed05b04788ccf163c1572f00a')

package() {
  cd "${srcdir}/ocrmypdf-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.rst $pkgdir/usr/share/licenses/$pkgname/LICENSE.rst
}

# vim:set ts=2 sw=2 et:
