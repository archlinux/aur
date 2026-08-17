# Maintainer: TheFeelTrain <the@feeltra.in>
pkgname=python-vsjetengine
_origpkgname=vsjetengine
pkgver=1.6.0
pkgrel=1
pkgdesc="An engine for vapoursynth previewers, renderers, and script analysis tools."
arch=("x86_64")
url='https://pypi.org/project/vsjetengine/'
license=("EUPL-1.2")
depends=("vapoursynth")
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
	"python-versioningit"
)
conflicts=("vapoursynth-plugin-vsengine-git")
source=("https://files.pythonhosted.org/packages/source/v/${_origpkgname}/${_origpkgname}-${pkgver}.tar.gz")
sha256sums=('0bc97430a44e5ad182296bb19e9af3b16e8095120972bef59fc0c911e9be275a')

package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
