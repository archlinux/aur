# Maintainer: Clem Lorteau <spam at lorteau dot fr>
pkgname=gs-pdf-compress
_origpkgname=gs_pdf_compress
pkgver=0.2.1
pkgrel=1
pkgdesc="Compress PDF files with Ghostscript"
arch=("any")
url='https://github.com/clorteau/pdfcompress'
license=("MIT")
depends=(
	"ghostscript"
	"python-pyqt6"
	"qt6-svg"
)
makedepends=(
	"python-build"
	"python-hatchling"
	"python-installer"
)
source=("https://files.pythonhosted.org/packages/6b/1a/f3df04e8481943129d181ce8049725657ee572444e9b248757037700d697/gs_pdf_compress-0.2.1.tar.gz")
sha256sums=("3ec2c6f9d9d4d0e57bf773f6f567476f95320c56244a808c60f6eb39177154e1")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 src/gs_pdf_compress/res/com.github.clorteau.pdfcompress.desktop "$pkgdir/usr/share/applications/com.github.clorteau.pdfcompress.desktop"
	install -Dm644 src/gs_pdf_compress/res/com.github.clorteau.pdfcompress.svg "$pkgdir/usr/share/icons/pdfcompress/com.github.clorteau.pdfcompress.svg"
}
# vim:set ts=2 sw=2 et:
