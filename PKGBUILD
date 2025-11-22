# Maintainer: TheFeelTrain <thefeeltrain@thefeeltrain.com>
pkgname=python-ass-tag-analyzer
_origpkgname=ass_tag_analyzer
pkgver=0.0.5
pkgrel=2
pkgdesc="Parse .ass tags."
arch=("x86_64")
url='https://pypi.org/project/ass-tag-analyzer/'
license=("MIT")
depends=()
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
)
source=("https://files.pythonhosted.org/packages/04/46/94e82b85be4be8164ae14d53abfef24cec5013927e5578efa9bbdd829992/ass_tag_analyzer-0.0.5.tar.gz")
sha256sums=("d526d3bff70d6db1946b7c349e79b9fde87c7fc69348b438b3e8962989475814")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
}
