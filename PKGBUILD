# Maintainer: TheFeelTrain <the@feeltra.in>
pkgname=python-hatch-cython
_origpkgname=hatch_cython
pkgver=0.6.0
pkgrel=1
pkgdesc="Cython build hooks for hatch"
arch=("x86_64")
url='https://pypi.org/project/hatch-cython/'
license=("MIT")
depends=(
	"cython"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
)
source=("https://files.pythonhosted.org/packages/d2/32/d13b765c225535d853ea1a9a94a2aa020bf4313707e359e4ffda09f00288/hatch_cython-0.6.0.tar.gz")
sha256sums=("b6480b417b919eb7138e1665e119db570585b486facc623ea62cb3026418ac4c")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
