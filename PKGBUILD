# Maintainer: Douglas Chimento <dchimento@gmail.com>
pkgname=python-yachalk
_name=${pkgname#python-}
pkgver=0.1.8
pkgrel=1
pkgdesc="${_name} python lib for terminal string styling done right"
url='https://github.com/bluenote10/yachalk'
depends=('python')
makedepends=('python-build' 'python-installer')
checkdepends=()
license=('MIT')
arch=('any')
source=('https://files.pythonhosted.org/packages/5b/e6/17b8642bc554083ca149f69c6b61a801e81afcbd60bb4aa22783d54322ed/yachalk-0.1.8.tar.gz')
sha256sums=('bb9b52fda52f34679c9b13d4284a8603eacb9da9d6365b870e0a0c8c41ea9382')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
