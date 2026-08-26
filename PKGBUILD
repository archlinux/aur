# Maintainer: TheFeelTrain <the@feeltra.in>
pkgname=python-fontcollector
_origpkgname=fontcollector
pkgver=4.0.3
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
source=("https://files.pythonhosted.org/packages/source/f/${_origpkgname}/${_origpkgname}-${pkgver}.tar.gz")
sha256sums=('8dca9a33e525b69e86c235940a8504543d5e4f97010af56928e97ab8eff086ff')

package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
