# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=vsview-split-planes
_origpkgname=vsview_split_planes
pkgver=0.1.2
pkgrel=1
pkgdesc="A vsview plugin displaying video clips' constituent planes"
arch=("x86_64")
url='https://pypi.org/project/vsview-split-planes/'
license=("MIT")
depends=(
    "vsview"
    "vapoursynth-plugin-vsakarin"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
)
source=("https://files.pythonhosted.org/packages/21/53/0984aed99bac4b755986f82048952940a54803db576cbc4626658c5d1dfb/vsview_split_planes-0.1.2.tar.gz")
sha256sums=("accf32d2db2e45992d580da6ee95523f476b80c95066d6f71a1e5724dc6ced67")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}