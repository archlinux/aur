# Maintainer: TheFeelTrain <thefeeltrain@thefeeltrain.com>
pkgname=python-fontcollector
_origpkgname=fontcollector
pkgver=3.1.2
pkgrel=3
pkgdesc="FontCollector for Advanced SubStation Alpha file."
arch=("x86_64")
url='https://pypi.org/project/FontCollector/'
license=("None")
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
source=("https://files.pythonhosted.org/packages/43/62/3948bd12882a5e6c9bd625dcd5396a37788d096239eb065fce5429fe59f8/fontcollector-3.1.2.tar.gz")
sha256sums=("4c9a41b2923c2a65efe94415051a04a9fa52e641635e871745fdee54e838fd8c")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}