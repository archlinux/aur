# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=python-nativeres
_origpkgname=nativeres
pkgver=0.1.2
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
sha256sums=('9b67b73443a86be612319f33dc89d6e2f182db9e37eb31b15e57626171fa8cfd')

package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
