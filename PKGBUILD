# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=python-nativeres
_origpkgname=nativeres
pkgver=0.5.0
pkgrel=1
pkgdesc="Descale analysis tools for VapourSynth"
arch=("x86_64")
url='https://pypi.org/project/nativeres/'
license=("MIT")
depends=(
	"python-jetpytools"
	"python-vsjetengine"
	"python-typer"
	"python-rich"
	"python-numpy"
	"python-scipy"
	"pyside6"
	"vapoursynth-plugin-vsjetpack"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
	"python-versioningit"
)
source=("https://files.pythonhosted.org/packages/source/n/${_origpkgname}/${_origpkgname}-${pkgver}.tar.gz")
sha256sums=('364f049820a2622cdf1999a9cad7c620f768a6bbff483c89414996e73dbf442e')

package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
