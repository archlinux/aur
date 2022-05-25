# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-types-setuptools
_name=${pkgname#python-}
pkgver=57.4.16
pkgrel=1
pkgdesc="Typing stubs for setuptools"
arch=('any')
url="https://github.com/python/typeshed"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('325d8db7eee39f67f78b7f000683cc81d651300060f67e6e93058e17c6951a9a')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
