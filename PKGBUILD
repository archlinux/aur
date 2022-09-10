# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=python-types-requests
_name=${pkgname#python-}
pkgver=2.28.10
pkgrel=2
pkgdesc="Typing stubs for requests"
arch=('any')
url="https://pypi.org/project/types-requests/"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('97d8f40aa1ffe1e58c3726c77d63c182daea9a72d9f1fa2cafdea756b2a19f2c')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
