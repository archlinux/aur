# Maintainer: TheFeelTrain <the@feeltra.in>
pkgname=python-vsjetengine
_origpkgname=vsjetengine
pkgver=1.4.0
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
sha256sums=('a4dc1b7a017e8bd4633da6863e13e86f4705bc8389ca44349e94cdb1561b76d6')

package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
