# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=vsview-nativeres
_origpkgname=vsview_nativeres
pkgver=0.2.0
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
source=("https://files.pythonhosted.org/packages/1d/32/c21b4c70af267c936691718eac512257dc16d204e780a6fe45ab60efb3e1/vsview_nativeres-0.2.0.tar.gz")
sha256sums=("c8e173fd7d51d837144ed9782ee20a863b03449a85e8aaedc2c39d79bbea38b8")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}