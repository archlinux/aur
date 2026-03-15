# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=vsview-fftspectrum
_origpkgname=vsview_fftspectrum
pkgver=0.1.2
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
source=("https://files.pythonhosted.org/packages/9c/e8/5490d301685511a82e676b008ef6fc4b543e627c2217f87c6f2540c9311d/vsview_fftspectrum-0.1.2.tar.gz")
sha256sums=("619b256905d2f3156a4595a4d8cb9b3ace3da9aa46594eea3e60abb59c445a0f")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}