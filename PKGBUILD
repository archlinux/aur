# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=python-vspackrgb
_origpkgname=vspackrgb
pkgver=1.1.1
pkgrel=1
pkgdesc="RGB packing for VapourSynth frames"
arch=("x86_64")
url='https://pypi.org/project/vspackrgb/'
license=("MIT")
depends=(
	"python-hatch-cython"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
	"python-versioningit"
)
source=("https://files.pythonhosted.org/packages/e1/65/d780917048c22ddc0f72c57aec18034ae9a67eed97f3a734514ff682e37e/vspackrgb-1.1.1-cp312-cp312-macosx_11_0_arm64.whl")
sha256sums=("d0f8d0a8bb3b35b16260d841be8859276421dde8410c2e897527a4b1028b800d")
package() {
    cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}