# Maintainer: TheFeelTrain <thefeeltrain@thefeeltrain.com>
pkgname=python-typed-ffmpeg-compatible
_origpkgname=typed_ffmpeg_compatible
pkgver=3.11
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
source=("https://files.pythonhosted.org/packages/08/09/e7cb846c4e83129f7f313df4e7ac5a3ec421353d4fbbf770ed31977741bc/typed_ffmpeg_compatible-3.11.tar.gz")
sha256sums=("c7c9b82f35e1c2c6808161da6d4a922ca06a2c2ac01b0449b1f2727989ed109e")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}