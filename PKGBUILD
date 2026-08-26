# Maintainer: TheFeelTrain <the@feeltra.in>
pkgname=python-typed-ffmpeg-compatible
_origpkgname=typed_ffmpeg_compatible
pkgver=4.5
pkgrel=1
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
sha256sums=('617838a8f2f2017dd001256c42bb5237e159af39931bfe43e1064ecfe29b7bd2')

package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
}
