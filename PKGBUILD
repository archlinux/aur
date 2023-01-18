# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-types-docutils
_name=${pkgname#python-}
pkgver=0.19.1.2
pkgrel=1
pkgdesc="Typing stubs for docutils"
arch=('any')
url="https://github.com/python/typeshed"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ca3d2135484adb52dd042bbddbd6eddcbbda8c608ba3f5e5f908bd548ffcb399')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
