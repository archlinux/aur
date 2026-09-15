# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=python-typed-ffmpeg-v9
_origpkgname=typed_ffmpeg_v9
pkgver=4.5
pkgrel=1
pkgdesc="Typed FFmpeg bindings for FFmpeg 9.x."
arch=("x86_64")
url='https://pypi.org/project/typed-ffmpeg-v9'
license=("MIT")
depends=(
	"ffmpeg>=9"
	"python-ffmpeg-core"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-setuptools-scm"
	"python-hatchling"
)
conflicts=(
 	"python-typed-ffmpeg-v8"
)
source=("https://files.pythonhosted.org/packages/source/t/${_origpkgname}/${_origpkgname}-${pkgver}.tar.gz")
sha256sums=('38e0a5af7b2fe0aebd0eeae3ddb1c8b16b89bf007ccfa4452ee0ea14aa31a5fa')

package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
}