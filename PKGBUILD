# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=vsview-frameprops-extended
_origpkgname=vsview_frameprops_extended
pkgver=0.1.2
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
source=("https://files.pythonhosted.org/packages/0d/f6/ff012f52f629e2fe7f26256a346636e750d75f575db456061fda6fd5a632/vsview_frameprops_extended-0.1.2.tar.gz")
sha256sums=("43c901726f92dd50e7f41c9d8f41b8004f6c1ca38ed542adfa62a87bda777831")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}