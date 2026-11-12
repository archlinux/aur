# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=python-hatch-rs
_origpkgname=hatch_rs
pkgver=0.5.0
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
sha256sums=('5b6e04ba8346d71a3007d9efa6bb1632ef3a37fa90a9d2fc17e83b0ffd9df6cd')

package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
