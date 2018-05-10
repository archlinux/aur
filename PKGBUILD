# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Daniel Reuter <daniel.robin.reuter@googlemail.com>
pkgname=ocrmypdf
pkgver=6.1.5
pkgrel=1
pkgdesc="A tool to add an OCR text layer to scanned PDF files, allowing them to be searched"
url="https://github.com/jbarlow83/OCRmyPDF"
arch=('any')
license=('custom')
depends=('python>=3.5' 'python-cffi>=1.9.1' 'python-pillow>=4.0.0'
         'python-defusedxml>=0.5'
         'python-pypdf2>=1.26' 'python-reportlab>=3.3.0'
         'python-ruffus>=2.6.3' 'ghostscript>=9.15' 'qpdf>=7.0.0'
         'tesseract>=3.04' 'unpaper>=6.1' 'img2pdf>=0.2.3')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/ec/49/d14db3aa365d6ebc796ebd62570bc5b28654b796a92abdd034b8f2916913/ocrmypdf-6.1.5.tar.gz")
sha256sums=('63861eaf2942f7ec5ed6a0ce5341b1b710a05656f8876051ffdd1453c02155e7')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.rst
}

# vim:set ts=2 sw=2 et:
