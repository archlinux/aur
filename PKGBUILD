# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-types-setuptools
_name=${pkgname#python-}
pkgver=67.1.0.2
pkgrel=1
pkgdesc="Typing stubs for setuptools"
arch=('any')
url="https://github.com/python/typeshed"
license=('Apache')
depends=('python' 'python-types-docutils')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('947ea9d25222330e47f56e8960955b36ae6b4d589da09ab50561f1ed5e22ab2f')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
