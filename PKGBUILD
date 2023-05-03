# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-types-docutils
_name=${pkgname#python-}
pkgver=0.19.1.9
pkgrel=1
pkgdesc="Typing stubs for docutils"
arch=('any')
url="https://github.com/python/typeshed"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1d029567e67c52992fd42aa968778bc10a5e445c8450fc751d672d6f50330a4a')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
