# Maintainer: Philipp A. <flying-sheep@web.de>

_name=wheel-filename
pkgname=python-$_name
pkgver=2.1.0
pkgrel=1
pkgdesc='Parse wheel filenames'
arch=(any)
url="https://github.com/jwodder/$_name"
license=(MIT)
depends=(python)
makedepends=(python-hatchling python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name/-/_}-$pkgver.tar.gz")
sha256sums=('4c12c51ee92d5fb77ed0932e4f83ff82d8b129b845422f0a1ab2ab9d2d2e2aa4')

build() {
	cd "${_name/-/_}-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name/-/_}-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
