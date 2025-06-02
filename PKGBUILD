pkgname=python-partdb-labeler
_origpkgname=partdb-labeler
pkgver=0.1.0
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
	"python-wheel"
	"python-setuptools"
	"python-flit-core"
)
source=("https://gitlab.alfter.us/salfter/partdb-labeler/-/archive/v${pkgver}/partdb-labeler-v${pkgver}.tar.bz2")
sha256sums=("f68e63d688478739045b87bf7c709d98df38947277e72c92e3c85134a19dc9c3")
package() {
	cd "${_origpkgname}-v${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
}
