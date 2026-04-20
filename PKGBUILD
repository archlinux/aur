# Maintainer: TheFeelTrain <the@feeltra.in>
pkgname=python-typed-ffmpeg-compatible
_origpkgname=typed_ffmpeg_compatible
pkgver=4.1
pkgrel=2
pkgdesc="Modern Python FFmpeg wrappers offer comprehensive support for complex filters, complete with detailed typing and documentation."
arch=("x86_64")
url='https://pypi.org/project/typed-ffmpeg-compatible/'
license=("MIT")
depends=(
	"ffmpeg"
	"python-typed-ffmpeg-v8"
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
sha256sums=('46fe69c08c066d994c033d7037ffd06b382237c7711a6460cd040bd4bba7e8da')

package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
}