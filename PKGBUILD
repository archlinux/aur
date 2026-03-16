# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=vsview-frameprops-extended
_origpkgname=vsview_frameprops_extended
pkgver=0.1.4
pkgrel=1
pkgdesc="A vsview plugin adding more categories and formatters to the built-in vsview frameprops tool"
arch=("x86_64")
url='https://pypi.org/project/vsview-frameprops-extended/'
license=("MIT")
depends=(
    "vsview"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
    "python-versioningit"
)
source=("https://files.pythonhosted.org/packages/34/82/19daf9ec41efe64467364eabc8609b34b8f6d38cc2c3885ba3bc6be98539/vsview_frameprops_extended-0.1.4.tar.gz")
sha256sums=("23c78cc7c491077718485b116d86ef482e587d82a3565346bc90dfa73d35d5b8")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}