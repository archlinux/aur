# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=python-vsmuxtools
_origpkgname=vsmuxtools
pkgver=0.4.2
pkgrel=1
pkgdesc="The extension to muxtools with vapoursynth and encoding stuff"
arch=("x86_64")
url='https://pypi.org/project/vsmuxtools/'
license=("MPL-2.0")
depends=(
	"vapoursynth"
	"vapoursynth-plugin-vsjetpack"
	"python-numpy"
	"python-muxtools"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
)
provides=(
	"vapoursynth-plugin-${_origpkgname}"
	"python-vsmuxtools"
)
conflicts=("vapoursynth-plugin-${_origpkgname}")
source=("https://files.pythonhosted.org/packages/b0/18/991555dd0034dc16cc9581dfac09a95e373ffc32140d93ae856f04884a96/vsmuxtools-0.4.2.tar.gz")
sha256sums=("12b841f0f07c98756d616922531af51fb016b74c20d2e79a90e5bf12f54d8ced")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}