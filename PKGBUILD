# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-types-docutils
_name=${pkgname#python-}
pkgver=0.19.1.7
pkgrel=1
pkgdesc="Typing stubs for docutils"
arch=('any')
url="https://github.com/python/typeshed"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('cb6e0dd1c895c723002ec4dc8334bf9df04726ef0cf13f5597501578b47eef30')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
