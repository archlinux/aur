# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Daniel Reuter <daniel.robin.reuter@googlemail.com>
pkgname=ocrmypdf
pkgver=5.4.2
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
source=("https://pypi.python.org/packages/6d/c4/764d141f612a9cf323cba31164236fb9a499c1cd932309117e1218e72c8c/ocrmypdf-${pkgver}.tar.gz")
sha256sums=('464654a7eb08c3d40c2ebac676326b4c48343bdd72f0a4abb6ba38fd2582d921')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.rst $pkgdir/usr/share/licenses/$pkgname/LICENSE.rst
}

# vim:set ts=2 sw=2 et:
