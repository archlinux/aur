# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Daniel Reuter <daniel.robin.reuter@googlemail.com>
pkgname=ocrmypdf
pkgver=5.4.4
pkgrel=1
pkgdesc="A tool to add an OCR text layer to scanned PDF files, allowing them to be searched"
url="https://github.com/jbarlow83/OCRmyPDF"
arch=('any')
license=('custom')
depends=('python>=3.5' 'python-cffi>=1.9.1' 'python-pillow>=4.0.0'
         'python-pypdf2>=1.26' 'python-reportlab>=3.3.0'
         'python-ruffus>=2.6.3' 'ghostscript>=9.15' 'qpdf>=7.0.0'
         'tesseract>=3.04' 'unpaper>=6.1' 'img2pdf>=0.2.3')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/9b/c0/13a0ffb2184b85018b64466d1303ec1ceee05acff0b8ada16fdbf2ec101d/ocrmypdf-${pkgver}.tar.gz")
sha256sums=('e523591c5d4e4a8cdeee2e9e24c3f631c8638a803dba74c5b8b274681784dbf4')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.rst $pkgdir/usr/share/licenses/$pkgname/LICENSE.rst
}

# vim:set ts=2 sw=2 et:
