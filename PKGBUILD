# Maintainer: TheFeelTrain <thefeeltrain@thefeeltrain.com>
pkgname=python-fontcollector
_origpkgname=fontcollector
pkgver=4.0.1
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
source=("https://files.pythonhosted.org/packages/07/74/41153e81f9f3d088710faa792146e13b53c87adbe46da186d37b39bb789a/fontcollector-4.0.1.tar.gz")
sha256sums=("3440e1d25f7500be657dc4cadb9f46b7f159b8a587294ff37396d02d0cf00943")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}