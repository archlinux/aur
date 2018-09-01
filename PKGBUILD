# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>
# Contributor: Daniel Reuter <daniel.robin.reuter@googlemail.com>

pkgname=ocrmypdf
pkgver=7.0.4
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
                'python-reportlab>=3.3.0'
)

makedepends=('python-setuptools')
optdepends=('jbig2enc: Better compression algorithm; results in smaller PDF files')
source=("https://files.pythonhosted.org/packages/2b/c1/d734ed25a1c60a43096d74e15f2f2ee4ff5e0447d40a058e0d8c7c12c9e5/ocrmypdf-7.0.4.tar.gz")
sha256sums=('65f0df062b25cad3fe1c8e46c45705c7db48df37a54dd202109a50f15b89987a')

package () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.rst
}

# vim:set ts=2 sw=2 et:
