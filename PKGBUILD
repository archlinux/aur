pkgname=python-partdb-labeler
_origpkgname=partdb-labeler
pkgver=0.2.2
pkgrel=1
pkgdesc="print PartDB labels on a Zebra label printer"
arch=("x86_64")
url='https://gitlab.alfter.us/salfter/partdb-labeler/'
license=("None")
depends=(
	"python-requests"
	"python-zebra"
	"python-qrcode"
	"python-pillow"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-setuptools"
)
source=("https://gitlab.alfter.us/salfter/partdb-labeler/-/archive/v${pkgver}/partdb-labeler-v${pkgver}.tar.bz2")
sha256sums=("0d1c5afafd0b326b3d8011f1e9fd107b1853e6241ce6b6b3cca2bc5c368c4f82")

build() {
	cd "${_origpkgname}-v${pkgver}" || exit
	python -m build --wheel --no-isolation
}

package() {
	cd "${_origpkgname}-v${pkgver}" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
}
