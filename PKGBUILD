_name=pyefd
pkgname=python-$_name
pkgver=1.8.0
pkgrel=1
pkgdesc='Elliptic Fourier Features of a Closed Contour'
arch=(any)
url="https://github.com/hbldh/$_name"
license=(MIT)
depends=(python-numpy)
makedepends=(python-setuptools python-build python-installer)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9c1fa88337e90f65bdd0115d9c827cc31d638b6acda8c4c7d158293c59d99697')

build() {
	cd "${_name/-/_}-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name/-/_}-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
