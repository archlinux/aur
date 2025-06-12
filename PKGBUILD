pkgname=python-partdb-labeler
_origpkgname=partdb-labeler
pkgver=0.3
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
sha256sums=("e4b19d5e1cc870e93a922897c3bf75ff7982362313c950138826eb16cd499761")

build() {
	cd "${_origpkgname}-v${pkgver}" || exit
	python -m build --wheel --no-isolation
}

package() {
	cd "${_origpkgname}-v${pkgver}" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
}
