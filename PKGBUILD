# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>
# Contributor: Daniel Reuter <daniel.robin.reuter@googlemail.com>

pkgname=ocrmypdf
pkgver=7.0.2
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
source=("https://files.pythonhosted.org/packages/ca/80/3ec566e800057bfb9c7d9c7278eb7fcc6d2f15195e544214433c649a6daf/ocrmypdf-7.0.2.tar.gz")
sha256sums=('0070cec34acda08a06667fe6ab6bca3257822811428cd455198071a465eb777e')

package () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.rst
}

# vim:set ts=2 sw=2 et:
