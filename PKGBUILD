# Maintainer: TheFeelTrain <thefeeltrain@thefeeltrain.com>

pkgname=vapoursynth-plugin-vodesfunc
_origpkgname=vodesfunc
pkgver=1.11.0
pkgrel=1
pkgdesc="Vodes' random Vapoursynth Functions."
arch=("x86_64")
url='https://pypi.org/project/vodesfunc/'
license=("MPL-2.0")
depends=()
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
)
source=("https://files.pythonhosted.org/packages/00/c4/8f81966bca043684c7a8050f7a12a1b6691c94ada508c3855b8de94d3d63/vodesfunc-1.11.0.tar.gz")
sha256sums=("5e5ee30a6bdddec3b9f1341934a889c77f1b5c1b14ccfb5bd9a97365eb82e1f7")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
