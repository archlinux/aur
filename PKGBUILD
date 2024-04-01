# Maintainer: cqzw555 <cqzw555@163.com>

_name=pycnite
pkgname=python-$_name
pkgver=2023.10.11
pkgrel=1
pkgdesc='Python bytecode utilities'
arch=(any)
url='https://github.com/google/pycnite.git'
license=('Apache-2.0')
depends=(
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

source=(
  "https://files.pythonhosted.org/packages/source/p/$_name/$_name-$pkgver.tar.gz"
)
b2sums=(
  '162dab1fb94fbf7f18f8fc4093a5b9aa010cb0fe4a8779c313ad21630879acc2eb1e74cec3fff0ef68df9c118dc070ff3020635df520dbe9a5bcff0c8e86e982'
)

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
