# Maintainer: TheFeelTrain <thefeeltrain@thefeeltrain.com>
pkgname=python-typed-ffmpeg-compatible
_origpkgname=typed_ffmpeg_compatible
pkgver=3.10
pkgrel=1
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
source=("https://files.pythonhosted.org/packages/1e/99/d1d2f25c64fee5948c99930eae8758eac7b5b4cbc9655099cc643a763c89/typed_ffmpeg_compatible-3.10.tar.gz")
sha256sums=("f66b330edb04be83aef6fbdd3d28075fab01088b7bbb1326ba0ce29d255bcd45")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}