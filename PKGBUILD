# Maintainer Evgeniy Dombek <edombek@yandex.ru>

pkgname=python-pyindi-git
pkgver=v1.9
pkgrel=1
pkgdesc="An INDI Client Python API, auto-generated from the official C++ API using SWIG."
license=('GPL3')
source=('git+https://github.com/indilib/pyindi-client')
arch=('x86_64')
md5sums=('SKIP')
depends=(libindi python python-setuptools)
makedepends=(swig)

provides=(python-pyindi)
conflicts=(python-pyindi)

pkgver() {
  cd pyindi-client
  git describe --long --tags | sed 's/-/./;s/-/./'
}

package() {
    cd pyindi-client
    python setup.py install --root="$pkgdir/" --optimize=1
}
