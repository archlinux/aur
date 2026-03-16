# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=vsview-fftspectrum
_origpkgname=vsview_fftspectrum
pkgver=0.1.3
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
source=("https://files.pythonhosted.org/packages/76/1d/08a286b2b0a5809d2980dc7a37d67b701faef9278b3d51028b8f4a671d1b/vsview_fftspectrum-0.1.3.tar.gz")
sha256sums=("36900447b7e617b65626e8871e947bbb33c223786277a033a2b7d2d1ed7a1d25")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}