# Maintainer: TheFeelTrain <thefeeltrain@thefeeltrain.com>
pkgname=python-typed-ffmpeg-compatible
_origpkgname=typed_ffmpeg_compatible
pkgver=3.6
pkgrel=1
pkgdesc="Modern Python FFmpeg wrappers offer comprehensive support for complex filters, complete with detailed typing and documentation."
arch=("x86_64")
url='https://pypi.org/project/typed-ffmpeg-compatible/'
license=("None")
depends=()
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
)
source=("https://files.pythonhosted.org/packages/41/0c/0377e1c6fa0cbbf8ed9f5c47db964e75831d2c42eb0c66c52f967c86e7b3/typed_ffmpeg_compatible-3.6.tar.gz")
sha256sums=("d2f4607b4614c905c901aef8b6e82ad474d3bc089cc622f085c0a49ec6dac8ee")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

