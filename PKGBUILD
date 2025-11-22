# Maintainer: TheFeelTrain <thefeeltrain@thefeeltrain.com>
pkgname=python-typed-ffmpeg-compatible
_origpkgname=typed_ffmpeg_compatible
pkgver=3.7.1
pkgrel=3
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
source=("https://files.pythonhosted.org/packages/d5/6e/10ae1ea1ee255a48039ca6cce5db46b47dd00f4c09c32460b12041e1d7ec/typed_ffmpeg_compatible-3.7.1.tar.gz")
sha256sums=("717f1e7de132405440744eb099ce59518fec9ac5d161fd03d95c59ac600f53ab")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}