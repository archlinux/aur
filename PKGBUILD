# Maintainer Evgeniy Dombek <edombek@yandex.ru>

pkgname=python-pyindi-git
pkgver=v1.9.1.7.gc05c7a4
pkgrel=1
pkgdesc="An INDI Client Python API, auto-generated from the official C++ API using SWIG."
url="https://siril.org/tutorials/pysiril/"
license=('custom')
source=('git+https://github.com/indilib/pyindi-client')
arch=('x86_64')
md5sums=('SKIP')
depends=(libindi python python-setuptools)
makedepends=(swig)

pkgver() {
  cd pyindi-client
  git describe --long --tags | sed 's/-/./;s/-/./'
}

package() {
    cd pyindi-client
    python setup.py install --root="$pkgdir/" --optimize=1
}
