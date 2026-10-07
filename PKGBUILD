# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=python-nativeres
_origpkgname=nativeres
pkgver=0.4.1
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
sha256sums=('8fb83f77fe5d7e7ae804a4e4fcdb318d90007046daf9519ed2c3009f374283e4')

package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
