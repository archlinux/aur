# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=vsview-comp
_origpkgname=vsview_comp
pkgver=0.2.0
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
source=("https://files.pythonhosted.org/packages/49/da/39290e76db8c9b85f4020314d42ac7d1711a8553fc1e73668420e51d7fe2/vsview_comp-0.2.0.tar.gz")
sha256sums=("96184ad9a8bfc494722251d85a3203e05197c1433392a89d94a62f9313572d89")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}