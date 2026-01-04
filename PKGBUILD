# Maintainer: TheFeelTrain <thefeeltrain@thefeeltrain.com>
pkgname=python-fontcollector
_origpkgname=fontcollector
pkgver=4.0.0
pkgrel=1
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
source=("https://files.pythonhosted.org/packages/20/38/59d76260bd416b079d31a21ffe6e9857c385b910b354dc6e21d583cd4838/fontcollector-4.0.0.tar.gz")
sha256sums=("6ee779726873a057313aeff6a5ba9ea621652e7b4571ff43c72e4f20a207a7d1")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}