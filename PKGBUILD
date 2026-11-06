# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=python-hatch-rs
_origpkgname=hatch_rs
pkgver=0.4.4
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
sha256sums=('08b0a25d338aa445a3bccbb66ac98c9b0f6578a2636322ba5e5740fe47d4876f')

package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
