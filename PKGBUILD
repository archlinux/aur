# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=python-types-requests
_name=${pkgname#python-}
pkgver=2.28.2
pkgrel=1
pkgdesc="Typing stubs for requests"
arch=('any')
url="https://pypi.org/project/types-requests/"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('398f88cd9302c796cb63d1021af2a1fb7ae507741a3d508edf8e0746d8c16a04')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
