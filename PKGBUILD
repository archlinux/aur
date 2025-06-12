pkgname=python-partdb-labeler
_origpkgname=partdb-labeler
pkgver=0.3.1
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
sha256sums=("c51fcfb0ba244f42327d313c7a00dafc95dfe4c972d9a5623e8969c55f5439c8")

build() {
	cd "${_origpkgname}-v${pkgver}" || exit
	python -m build --wheel --no-isolation
}

package() {
	cd "${_origpkgname}-v${pkgver}" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
}
