# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-types-setuptools
_name=${pkgname#python-}
pkgver=68.0.0.1
pkgrel=1
pkgdesc="Typing stubs for setuptools"
arch=('any')
url="https://github.com/python/typeshed"
license=('Apache')
depends=('python' 'python-types-docutils')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a0454ea7ad0711f63a602caa87929003a83cab89224ae1506ed44bb5be8fe7d7')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
