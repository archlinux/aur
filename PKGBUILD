# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Daniel Reuter <daniel.robin.reuter@googlemail.com>
pkgname=ocrmypdf
pkgver=4.3.5
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
source=("https://pypi.python.org/packages/f3/d3/b4b3bbae90bc1ce27d5bb4ba34d0b1433bd1f039ebfdcc6d3876c31bac55/ocrmypdf-${pkgver}.tar.gz")
sha256sums=('3e10cb52aa67a0cd2ecbf4eda336c504c561a86c24ade2e65b27556cd5466634')

package() {
  cd "${srcdir}/ocrmypdf-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.rst $pkgdir/usr/share/licenses/$pkgname/LICENSE.rst
}

# vim:set ts=2 sw=2 et:
