# Maintainer: TheFeelTrain <thefeeltrain@thefeeltrain.com>
pkgname=python-fontcollector
_origpkgname=fontcollector
pkgver=4.0.2
pkgrel=1
pkgdesc="FontCollector for Advanced SubStation Alpha file."
arch=("x86_64")
url='https://pypi.org/project/FontCollector/'
license=("MIT")
depends=(
	"fontconfig"
	"mkvtoolnix-cli"
	"python-ass"
	"python-ass-tag-analyzer"
	"python-fonttools"
	"python-freetype-py"
	"python-findsystemfontsfilename"
	"python-langcodes"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
)
source=("https://files.pythonhosted.org/packages/33/8e/bdb0312fd0c6ed8b31c5bee524826954067367518b25a8030a8ca15519a8/fontcollector-4.0.2.tar.gz")
sha256sums=("81cb6e6cedd257f30db9996f2a829333c695559398523b6fa4ab7284da0af55d")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}