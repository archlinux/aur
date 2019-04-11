# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>
# Contributor: Daniel Reuter <daniel.robin.reuter@googlemail.com>

pkgname=ocrmypdf
pkgver=8.2.3
pkgrel=1
pkgdesc="A tool to add an OCR text layer to scanned PDF files, allowing them to be searched"
url="https://github.com/jbarlow83/OCRmyPDF"
arch=('any')
license=(GPL3)
# NOTICE: The number of dependencies we rely on is *very high*. If the program does not run after an upgrade, make sure all your deps are upgraded, especially AUR deps!
depends=('python' 'python-cffi' 'img2pdf' 'python-pillow' 'python-ruffus' 'tesseract' 'ghostscript' 'unpaper' 'leptonica' 'qpdf' 'pngquant' 'python-defusedxml' 'python-pikepdf' 'python-reportlab' 'python-pdfminer.six' 'python-lxml')

makedepends=('python-setuptools')
optdepends=('jbig2enc: Better compression algorithm; results in smaller PDF files')
source=("https://files.pythonhosted.org/packages/20/73/898747dbdfbc4f218c07009286da1210faae61c306cbf31d073f82d6b752/ocrmypdf-8.2.3.tar.gz")
sha256sums=('950e04fe22933afd08bbafa3511ea77e3574d38ae8eb88e64849243fa509c9d5')

package () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.rst
}

# vim:set ts=2 sw=2 et:
