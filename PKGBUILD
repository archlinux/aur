# Maintainer: Philipp A. <flying-sheep@web.de>

_name=reretry
pkgname=python-$_name
pkgver=0.11.8
pkgrel=1
pkgdesc='An easy to use, but functional decorator for retrying on exceptions'
arch=(any)
url="https://github.com/leshchenko1979/$_name"
license=(Apache)
depends=(python)
makedepends=(python-setuptools python-pbr python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f2791fcebe512ea2f1d153a2874778523a8064860b591cd90afc21a8bed432e3')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
