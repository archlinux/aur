# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Daniel Reuter <daniel.robin.reuter@googlemail.com>
pkgname=ocrmypdf
pkgver=4.4.2
pkgrel=1
pkgdesc="A tool to add an OCR text layer to scanned PDF files, allowing them to be searched"
url="https://github.com/jbarlow83/OCRmyPDF"
arch=('any')
license=('custom')
depends=('python' 'python-cffi>=1.5.2' 'python-pillow>=3.1.0'
         'python-pypdf2>=1.26' 'python-reportlab>=3.2.0'
         'python-ruffus>=2.6.3' 'ghostscript>=9.15' 'qpdf>=5.0.0'
         'tesseract>=3.03' 'unpaper>=6.1' 'python-img2pdf>=0.2.1')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/38/72/d445ac27fb6d6a5b3c88ab64945382e7e6c636f570d8efc51549f4cfb4a4/ocrmypdf-${pkgver}.tar.gz")
sha256sums=('51474e8b16ea82ec0065bcca1afd8ac7a5ef1e51bf025ea4b7b2a2cf3017cb1c')

package() {
  cd "${srcdir}/ocrmypdf-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.rst $pkgdir/usr/share/licenses/$pkgname/LICENSE.rst
}

# vim:set ts=2 sw=2 et:
