# Contributor: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>
# Contributor: Daniel Reuter <daniel.robin.reuter@googlemail.com>

pkgnameorg=ocrmypdf
pkgname=ocrmypdf-py3
pkgverorg=9.7.1
pkgver=$pkgverorg
pkgrel=1
pkgdesc="A tool to add an OCR text layer to scanned PDF files, allowing them to be searched"
url="https://github.com/jbarlow83/OCRmyPDF"
arch=('any')
license=(GPL3)
# NOTICE: The number of dependencies we rely on is *very high*. If the program does not run after an upgrade, make sure all your deps are upgraded, especially AUR deps!
depends=('python' 'python-cffi' 'img2pdf' 'python-pillow' 'tesseract' 'ghostscript' 'unpaper' 'leptonica' 'pngquant' 'python-pikepdf' 'python-reportlab' 'python-pdfminer.six' 'python-tqdm')
conflicts=("ocrmypdf" "python-pdfminer")
makedepends=('python-setuptools')
optdepends=('jbig2enc: Better compression algorithm; results in smaller PDF files')
source=("https://files.pythonhosted.org/packages/4d/13/a9969946ee6a02a3dfc89fb487b8039bd93940036c43715f35760beb18eb/ocrmypdf-9.7.1.tar.gz")
sha256sums=('fd029b97463e054d95eed361843397a76b2aa35913ac96c57cf8c15a15411971')
 
package () {
  cd "${srcdir}/${pkgnameorg}-${pkgverorg}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.rst
}

# vim:set ts=2 sw=2 et:
