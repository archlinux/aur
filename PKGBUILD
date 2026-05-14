# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=python-hatch-sbom
_origpkgname=hatch_sbom
pkgver=0.4.0
pkgrel=1
pkgdesc="Hatchling build hook plugin for generating Software Bill of Materials (SBOM)"
arch=("x86_64")
url='https://pypi.org/project/hatch-sbom/'
license=("MIT")
depends=(
   	"python-hatch"
	"python-hatch-vcs"
	"uv"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
)
source=("https://files.pythonhosted.org/packages/source/h/${_origpkgname}/${_origpkgname}-${pkgver}.tar.gz")
sha256sums=('a431b6f141e726c0c6e4a102791eb906e90010bc5d2e17a333b8816862e09236')

package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
}
