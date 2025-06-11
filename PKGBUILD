pkgname=python-partdb-labeler
_origpkgname=partdb-labeler
pkgver=0.2.3
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
sha256sums=("3b7074226a6b1449f89131a34f051ad311bb3685ef361d98563b84b61f545d9e")

build() {
	cd "${_origpkgname}-v${pkgver}" || exit
	python -m build --wheel --no-isolation
}

package() {
	cd "${_origpkgname}-v${pkgver}" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
}
