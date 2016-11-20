# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Daniel Reuter <daniel.robin.reuter@googlemail.com>
pkgname=ocrmypdf
pkgver=4.3.2
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
source=("https://pypi.python.org/packages/55/2c/9b24ec0d4b7241af9f607069f91243748a065923f2b1a897334b70674102/ocrmypdf-${pkgver}.tar.gz")
sha256sums=('37b0590791b945c82e96c2533852d2e709399d52206a2fd1a4e34feafedb7269')

package() {
  cd "${srcdir}/ocrmypdf-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.rst $pkgdir/usr/share/licenses/$pkgname/LICENSE.rst
}

# vim:set ts=2 sw=2 et:
