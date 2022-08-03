# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-types-setuptools
_name=${pkgname#python-}
pkgver=63.2.3
pkgrel=1
pkgdesc="Typing stubs for setuptools"
arch=('any')
url="https://github.com/python/typeshed"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c0f5d452976e390527276fc4a6aa97cc1a38f4edb904f787441e70a472c37d44')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
