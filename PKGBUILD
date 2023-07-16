# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-types-setuptools
_name=${pkgname#python-}
pkgver=68.0.0.2
pkgrel=1
pkgdesc="Typing stubs for setuptools"
arch=('any')
url="https://github.com/python/typeshed"
license=('Apache')
depends=('python' 'python-types-docutils')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fede8b46862dd9fe68a12f11a8444c3d240d11178eba7d584d6f22ca3114b894')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
