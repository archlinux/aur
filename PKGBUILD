# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Daniel Reuter <daniel.robin.reuter@googlemail.com>
pkgname=ocrmypdf
pkgver=5.2
pkgrel=1
pkgdesc="A tool to add an OCR text layer to scanned PDF files, allowing them to be searched"
url="https://github.com/jbarlow83/OCRmyPDF"
arch=('any')
license=('custom')
depends=('python' 'python-cffi>=1.5.2' 'python-pillow>=3.1.0'
         'python-pypdf2>=1.26' 'python-reportlab>=3.2.0'
         'python-ruffus>=2.6.3' 'ghostscript>=9.15' 'qpdf>=5.0.0'
         'tesseract>=3.03' 'unpaper>=6.1' 'img2pdf>=0.2.1')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/57/d9/711ae2e179548d89e8ff1a9387783d65bf31376a5420eac8e4e9e90cd336/ocrmypdf-${pkgver}.tar.gz")
sha256sums=('0ff16e4849b8c8044c5a7e2743b97270a328952a7e5b74a92c51fb400a88350d')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.rst $pkgdir/usr/share/licenses/$pkgname/LICENSE.rst
}

# vim:set ts=2 sw=2 et:
