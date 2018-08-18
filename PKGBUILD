# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>
# Contributor: Daniel Reuter <daniel.robin.reuter@googlemail.com>

pkgname=ocrmypdf
pkgver=7.0.3
pkgrel=1
pkgdesc="A tool to add an OCR text layer to scanned PDF files, allowing them to be searched"
url="https://github.com/jbarlow83/OCRmyPDF"
arch=('any')
license=('custom')
depends=('python>=3.5'
                'python-cffi>=1.11.5'
                'img2pdf>=0.3.0'
                'python-pillow>=5.0.0'
         'python-ruffus>=2.7.0'
         # A version cannot be provided because then building with tesseract-git
         # no longer works. If you know a better fix, please comment.
         'tesseract'
                'ghostscript>=9.15'
                'unpaper>=6.1'
                'leptonica>=1.76.0'
                'qpdf>=8.1.0'
                'pngquant>=2.0.0'
                'python-xmp-toolkit>=2.0.1'
                'python-pikepdf>=0.3.1'
)

makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/bd/78/26738c05ad79a67e315490463d974e98bb682c989eef3c9cf067f64bb81f/ocrmypdf-7.0.3.tar.gz")
sha256sums=('ba330ba8a82a228986d5d00d6147c1f2a51d8456065608af1e9160f8d454428a')

package () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.rst
}

# vim:set ts=2 sw=2 et:
