pkgname=python-partdb-labeler
_origpkgname=partdb-labeler
pkgver=0.3.1
pkgrel=2
pkgdesc="print PartDB labels on a Zebra label printer"
arch=("x86_64")
url='https://git.alfter.us/salfter/partdb-labeler/'
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
source=("https://git.alfter.us/salfter/partdb-labeler/archive/v${pkgver}.tar.gz")
sha256sums=("b3b8fcc22c4f88ed2e8e27df426814774b6a8d715aa817e09b30a5f0dd75fe45")

build() {
	cd "${_origpkgname}" || exit
	python -m build --wheel --no-isolation
}

package() {
	cd "${_origpkgname}" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
}
