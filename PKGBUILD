# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=vsview-fftspectrum
_origpkgname=vsview_fftspectrum
pkgver=0.1.1
pkgrel=1
pkgdesc="A vsview plugin displaying the Fast Fourier transform spectrum of a video clip"
arch=("x86_64")
url='https://pypi.org/project/vsview-fftspectrum/'
license=("MIT")
depends=(
    "vsview"
    "vapoursynth-plugin-fftspectrum-rs"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
    "python-versioningit"
)
source=("https://files.pythonhosted.org/packages/40/14/67c0067e331159c457d88a50be321aee6c2f3c0a8e20539f6a5ff80aaae9/vsview_fftspectrum-0.1.1.tar.gz")
sha256sums=("e5ca48e2ce22f832d1c081b4c87774817a5c4a8668d546b16a3336c0c9f45082")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}