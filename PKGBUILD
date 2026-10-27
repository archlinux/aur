# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=python-typed-ffmpeg-compatible
_origpkgname=typed_ffmpeg_compatible
pkgver=4.6.2
pkgrel=1
pkgdesc="Modern Python FFmpeg wrappers offer comprehensive support for complex filters, complete with detailed typing and documentation."
arch=("x86_64")
url='https://pypi.org/project/typed-ffmpeg-compatible/'
license=("MIT")
depends=(
	"ffmpeg"
	"python-typed-ffmpeg-v9"
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
sha256sums=('c37118814e2de28a3dd027bbd1f3f5820d862bd39c516d4ef952109c9cfdab29')

package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
}
