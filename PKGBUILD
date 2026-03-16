# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=vsview-nativeres
_origpkgname=vsview_nativeres
pkgver=0.1.0
pkgrel=1
pkgdesc="A vsview plugin for analyzing and determining the native resolution of video content"
arch=("x86_64")
url='https://pypi.org/project/vsview-nativeres/'
license=("MIT")
depends=(
    "vsview"
	"python-nativeres"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
    "python-versioningit"
)
source=("https://files.pythonhosted.org/packages/35/a6/9f38c7f99a1ebfe791220d3e6c0b35902d6bc79e528e1bd65071a8003291/vsview_nativeres-0.1.0.tar.gz")
sha256sums=("7c51a70dd9bc805cbfd3abaa3105829eacc6a8677775e0fba0866c7df26fad33")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}