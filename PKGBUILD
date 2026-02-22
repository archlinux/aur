# Maintainer: TheFeelTrain <thefeeltrain@thefeeltrain.com>
pkgname=python-vsjetengine
_origpkgname=vsjetengine
pkgver=1.1.0
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
)
conflicts=("vapoursynth-plugin-vsengine-git")
source=("https://files.pythonhosted.org/packages/8f/46/48df69732ccb663eef32572de54489a123fd466d3e544123b1a9b92d342a/vsjetengine-1.1.0.tar.gz")
sha256sums=("5464295595f18d499d4c9e28b78fbfc00993e7469b4259540dad552b24bad32a")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}