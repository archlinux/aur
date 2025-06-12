pkgname=python-partdb-labeler
_origpkgname=partdb-labeler
pkgver=0.2.4
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
sha256sums=("436ebf134b973f0a60c83578ce79e33245958cf6af0c12af50e1c7ea8801c434")

build() {
	cd "${_origpkgname}-v${pkgver}" || exit
	python -m build --wheel --no-isolation
}

package() {
	cd "${_origpkgname}-v${pkgver}" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
}
