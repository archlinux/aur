# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-types-docutils
_name=${pkgname#python-}
pkgver=0.20.0.1
pkgrel=1
pkgdesc="Typing stubs for docutils"
arch=('any')
url="https://github.com/python/typeshed"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f682b5459a1e6e28208742adb0be8573d1ecbddd442f00d202b0278c1c4418a2')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
