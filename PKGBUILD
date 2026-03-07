# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=vsview-split-planes
_origpkgname=vsview_split_planes
pkgver=0.1.1
pkgrel=1
pkgdesc="A vsview plugin displaying video clips' constituent planes"
arch=("x86_64")
url='https://pypi.org/project/vsview-split-planes/'
license=("MIT")
depends=(
    "vsview"
    "vapoursynth-plugin-vsakarin"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
)
source=("https://files.pythonhosted.org/packages/72/eb/3f853666ac41691142443475fe846e9a8d70892e22b33d286d54e5092667/vsview_split_planes-0.1.1.tar.gz")
sha256sums=("b3decb8f2f3f60683b8d05d3451645161e0e5d7f913dde5bdda7013bf2bd3148")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}