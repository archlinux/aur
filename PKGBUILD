# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=vsview-comp
_origpkgname=vsview_comp
pkgver=0.1.2
pkgrel=1
pkgdesc="A vsview plugin to make comparison backed by Slowpoke Pics"
arch=("x86_64")
url='https://pypi.org/project/vsview-comp/'
license=("MIT")
depends=(
    "vsview"
    "python-httpx"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
    "python-versioningit"
)
source=("https://files.pythonhosted.org/packages/d3/0a/30416f4b8afe551caff58604e8fed43552c3ac6327f0ddeb5b8d75fb3472/vsview_comp-0.1.2.tar.gz")
sha256sums=("979744fc6d3ac4bb757608aeac7ec93b6f188fc0035afbb2f8c3c2958e18321b")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}