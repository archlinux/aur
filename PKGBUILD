# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=vsview-split-planes
_origpkgname=vsview_split_planes
pkgver=0.1.3
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
source=("https://files.pythonhosted.org/packages/1b/c1/b7fad956f3e16afdb33f83dfecbfa331511f2de07f925f0c47f2f124f276/vsview_split_planes-0.1.3.tar.gz")
sha256sums=("0dccd736e619b8dad53bf0a5e204cc46ef43089bb2f05147b3e711ef76a60257")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}