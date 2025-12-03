# Maintainer: Philipp A. <flying-sheep@web.de>

_name=entry-points-txt
pkgname=python-$_name
pkgver=0.3.0
pkgrel=1
pkgdesc='Read & write entry_points.txt files'
arch=(any)
url="https://github.com/jwodder/$_name"
license=(MIT)
depends=(python)
makedepends=(python-hatchling python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('957f508508a761671f18870edd9deb83b36844c66251e9c8a0df55ee8ae0bf52')

build() {
	cd "${_name//-/_}-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name//-/_}-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
