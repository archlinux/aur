# Maintainer: Yvaniak <ewen at philippot dot biz>
# Contributor: Achmad Fathoni <fathno dot id at gmail dot com>
# Contributor: Yigit Sever <yigit at yigitsever dot com>

pkgname=python-types-requests
_name=${pkgname#python-}
pkgver=2.31.0.20240125
pkgrel=1
pkgdesc="Typing stubs for requests"
arch=('any')
url="https://pypi.org/project/types-requests/"
license=('Apache-2.0')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('03a28ce1d7cd54199148e043b2079cdded22d6795d19a2c2a6791a4b2b5e2eb5')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
