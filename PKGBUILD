# Maintainer: TheFeelTrain <the@feeltra.in>
pkgname=python-vsjetengine
_origpkgname=vsjetengine
pkgver=1.2.0
pkgrel=2
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
source=("https://files.pythonhosted.org/packages/cd/c5/0389f55cdc914005dbf1281d82f16da1cc5ef4696bff0cac8cf2a94b614b/vsjetengine-1.2.0.tar.gz")
sha256sums=("1e19eb83de71f42bf55548e1e1c2fafc1cd23a2c93da9373711868ed7ac90cfd")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}