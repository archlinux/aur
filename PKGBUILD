# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-types-docutils
_name=${pkgname#python-}
pkgver=0.20.0.2
pkgrel=1
pkgdesc="Typing stubs for docutils"
arch=('any')
url="https://github.com/python/typeshed"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('91ca0d7e3a0ea8b5a590689ed57d3fb93f1439f6e2055f6c567882dab3283b79')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
