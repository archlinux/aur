# Maintainer: TheFeelTrain <thefeeltrain@thefeeltrain.com>
pkgname=python-mkvinfo
_origpkgname=mkvinfo
pkgver=0.0.2
pkgrel=1
pkgdesc="Python library for probing matroska files with mkvmerge."
arch=("x86_64")
url='https://pypi.org/project/mkvinfo/'
license=("None")
depends=()
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
)
source=("https://files.pythonhosted.org/packages/af/c3/eac243e59cd75072357b6487ee702e6dd4a2948ce9a2caf6ee305de19c03/mkvinfo-0.0.2.tar.gz")
sha256sums=("1e827aca3c273dbe635be4a6dbb36fe32d31192e3d85479ad5faff5141dd6cb1")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

