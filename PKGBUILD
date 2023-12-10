# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-types-setuptools
_name=${pkgname#python-}
pkgver=69.0.0.0
pkgrel=1
pkgdesc="Typing stubs for setuptools"
arch=('any')
url="https://github.com/python/typeshed"
license=('Apache')
depends=('python' 'python-types-docutils')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b0a06219f628c6527b2f8ce770a4f47550e00d3e8c3ad83e2dc31bc6e6eda95d')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
