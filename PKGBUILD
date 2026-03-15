# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=vsview-comp
_origpkgname=vsview_comp
pkgver=0.1.3
pkgrel=1
pkgdesc="A vsview plugin to make comparison backed by Slowpoke Pics"
arch=("x86_64")
url='https://pypi.org/project/vsview-comp/'
license=("MIT")
depends=(
    "vsview"
    "python-httpx"
	"python-pathvalidate"
	"python-jinja"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
    "python-versioningit"
)
source=("https://files.pythonhosted.org/packages/38/b4/c39df6a8d1cb348ba072e24edb3a02bdef8d1c2e42a4f5c864f8b4d80019/vsview_comp-0.1.3.tar.gz")
sha256sums=("ffb2a6d6951deabe4b0a240000a64134e0fe7b17c98a6f8b24a783b4cde55c49")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}