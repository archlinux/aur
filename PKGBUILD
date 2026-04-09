# Maintainer: TheFeelTrain <the@feeltra.in>
pkgname=python-typed-ffmpeg-compatible
_origpkgname=typed_ffmpeg_compatible
pkgver=4.0.0
pkgrel=2
pkgdesc="Modern Python FFmpeg wrappers offer comprehensive support for complex filters, complete with detailed typing and documentation."
arch=("x86_64")
url='https://pypi.org/project/typed-ffmpeg-compatible/'
license=("MIT")
depends=(
	"ffmpeg"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-setuptools-scm"
	"python-hatchling"
)
source=("https://files.pythonhosted.org/packages/source/t/${_origpkgname}/${_origpkgname}-${pkgver}.tar.gz")
sha256sums=('9727b2ddc87ea81ac5e22c3b82e615b7f70eb058ac7c34d5c86346336c143667')

package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
}
