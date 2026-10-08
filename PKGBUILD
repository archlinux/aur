# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=python-hatch-rs
_origpkgname=hatch_rs
pkgver=0.4.2
pkgrel=2
pkgdesc="Hatch plugin for Rust builds"
arch=("x86_64")
url='https://pypi.org/project/hatch-rs/'
license=("None")
depends=(
	"python-hatchling"
	"python-packaging"
	"python-pydantic"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
)
source=("https://files.pythonhosted.org/packages/source/h/${_origpkgname}/${_origpkgname}-${pkgver}.tar.gz")
sha256sums=('1359769e3dfb9f005b72275d88bf7872384c42fc79fb68dd94988cf094b8a325')

package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}