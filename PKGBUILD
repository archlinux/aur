# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Daniel Reuter <daniel.robin.reuter@googlemail.com>
pkgname=ocrmypdf
pkgver=5.7.0
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
source=("https://pypi.python.org/packages/cc/b0/6d037507a945c5941188ce5fac17dcd0f68fde729664279aec5a2e84bc21/ocrmypdf-${pkgver}.tar.gz")
sha256sums=('4f239823b266d6268eb54f62d439943ee2be70d9989c32855e69e9a610136ff8')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.rst $pkgdir/usr/share/licenses/$pkgname/LICENSE.rst
}

# vim:set ts=2 sw=2 et:
