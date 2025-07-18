# Maintainer: Clem Lorteau <spam at lorteau dot fr>
pkgname=gs-pdf-compress
_origpkgname=gs_pdf_compress
pkgver=0.2
pkgrel=1
pkgdesc="Compress PDF files with Ghostscript"
arch=("any")
url='https://github.com/clorteau/pdfcompress'
license=("MIT")
depends=(
	"ghostscript"
	"python-pyqt6"
)
makedepends=(
	"python-build"
	"python-hatchling"
	"python-installer"
)
source=("https://files.pythonhosted.org/packages/a6/e8/f2911f5b0aca72b8588b02e2e0d561ceb5211dbbb64795f548dfc17c9ec5/gs_pdf_compress-0.2.tar.gz")
sha256sums=("9ef80f3a90c91b48c2b11a3d1cdb0eeb49d899cb255cf85d554a5f0e47c8391f")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
