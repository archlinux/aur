# Maintainer: TheFeelTrain <thefeeltrain@thefeeltrain.com>
pkgname=python-vsjetengine
_origpkgname=vsjetengine
pkgver=1.0.0
pkgrel=2
pkgdesc="An engine for vapoursynth previewers, renderers and script analyis tools."
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
)
conflicts=("vapoursynth-plugin-vsengine-git")
source=("https://files.pythonhosted.org/packages/e9/bb/6d2ed33b67c1821359f35e358e309042231b5918e3fea9522127a31a38c1/vsjetengine-1.0.0.tar.gz")
sha256sums=("bd5c003ce33ec37904c1f1b604d8a55db493223a71118b288572f0283babb713")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}