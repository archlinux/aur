# Maintainer: Philipp A. <flying-sheep@web.de>

_name=entry-points-txt
pkgname=python-$_name
pkgver=0.2.1
pkgrel=1
pkgdesc='Read & write entry_points.txt files'
arch=(any)
url="https://github.com/jwodder/$_name"
license=(MIT)
depends=(python)
makedepends=(python-hatchling python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('2bca930f93d510cb1629c434954f7c7166b98c3cc968df7fd3fc270bc3cf06e9')

build() {
	cd "${_name//-/_}-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name//-/_}-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
