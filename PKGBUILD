# Maintainer: TheFeelTrain <the@feeltra.in>
pkgname=python-fontcollector
_origpkgname=fontcollector
pkgver=4.0.4
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
sha256sums=('77687bb54ca64e0efa01affb63b0cd7a92b183ca8d0349ebc92da5b6c7eccda2')

package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
