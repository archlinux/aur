# Maintainer: Philipp A. <flying-sheep@web.de>

_name=scanpydoc
pkgname=python-$_name
pkgver=0.15.1
pkgrel=1
pkgdesc='A series of Sphinx extensions to get easy to maintain, numpydoc style documentation.'
arch=(any)
url="https://github.com/theislab/$_name"
license=(GPL3)
depends=(python-sphinx)
makedepends=(python-hatchling python-hatch-vcs python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1a41b990bad236ecadb39a19e2ad3e8b3ac1f1e2d25c10bc82616f08e7e132a5')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
