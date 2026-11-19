# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=python-hatch-rs
_origpkgname=hatch_rs
pkgver=0.6.1
pkgrel=1
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
sha256sums=('93349b93f378426fecf78a57e60b47afec8ee77c2c01d1346b8db5e914de22d0')

package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
