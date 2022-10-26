# Maintainer: Philipp A. <flying-sheep@web.de>

_name=reretry
pkgname=python-$_name
pkgver=0.11.1
pkgrel=1
pkgdesc='An easy to use, but functional decorator for retrying on exceptions'
arch=(any)
url="https://github.com/leshchenko1979/$_name"
license=(Apache)
depends=(python)
makedepends=(python-setuptools python-pbr python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4ae1840ae9e443822bb70543c485bb9c45d1d009e32bd6809f2a9f2839149f5d')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
