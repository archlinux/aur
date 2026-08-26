# Maintainer: TheFeelTrain <the@feeltra.in>
pkgname=python-vsjetengine
_origpkgname=vsjetengine
pkgver=1.7.0
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
sha256sums=('386dc930eedee92864d18925459ac80fd68e0ecf9112468ccbe6969fe6504c6f')

package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
