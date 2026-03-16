# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=python-nativeres
_origpkgname=nativeres
pkgver=0.1.1
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
source=("https://files.pythonhosted.org/packages/ee/bd/9d30b9d6af817b1b9fc8287ca3dbfe0352ec721bb9bd6aca72ef6b82fb66/nativeres-0.1.1.tar.gz")
sha256sums=("64b56313d2429645c97cf6bf4f6c2da004fbcaa607579a83a12f6a7cd642e9b0")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}