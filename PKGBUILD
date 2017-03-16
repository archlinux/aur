# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Daniel Reuter <daniel.robin.reuter@googlemail.com>
pkgname=ocrmypdf
pkgver=4.5.1
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
source=("https://pypi.python.org/packages/9f/b4/4c5826343154a6d11aa82ea40d83e7bb483e1a833539d7061d4ca9842e97/ocrmypdf-${pkgver}.tar.gz")
sha256sums=('6a2692cf1a7277be5139d94144406ac1c9a8c42da803e93b70e50e649c222aec')

package() {
  cd "${srcdir}/ocrmypdf-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.rst $pkgdir/usr/share/licenses/$pkgname/LICENSE.rst
}

# vim:set ts=2 sw=2 et:
