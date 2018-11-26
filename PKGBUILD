# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>
# Contributor: Daniel Reuter <daniel.robin.reuter@googlemail.com>

pkgname=ocrmypdf
pkgver=7.3.1
pkgrel=1
pkgdesc="A tool to add an OCR text layer to scanned PDF files, allowing them to be searched"
url="https://github.com/jbarlow83/OCRmyPDF"
arch=('any')
license=('custom')
# NOTICE: The number of dependencies we rely on is *very high*. If the program does not run after an upgrade, make sure all your deps are upgraded, especially AUR deps!
depends=('python' 'python-cffi' 'img2pdf' 'python-pillow' 'python-ruffus' 'tesseract' 'ghostscript' 'unpaper' 'leptonica' 'qpdf' 'pngquant' 'python-xmp-toolkit' 'python-pikepdf' 'python-reportlab' 'python-pdfminer.six')

makedepends=('python-setuptools')
optdepends=('jbig2enc: Better compression algorithm; results in smaller PDF files')
source=("https://files.pythonhosted.org/packages/ef/fe/32456d24cf833049c5e7286ff53e30f931a891783db681f49ddeb70c5473/ocrmypdf-7.3.1.tar.gz")
sha256sums=('8a7a24608d20bcaf823d91e67c596d2051634bf999d7594e0b7a6d4d6f87cd69')

package () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.rst
}

# vim:set ts=2 sw=2 et:
