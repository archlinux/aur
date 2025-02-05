# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=python-async-executor
pkgver=0.1.2
pkgrel=1
pkgdesc="Async execution pool"
url='https://github.com/nvllsvm/async-executor'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=(https://github.com/nvllsvm/async-executor/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('e3b62201bea6633988fb318f62931f1f4107fa3293ba5003aa066f4ed2f775514e5ecdcedb489162d65e8f18460c0558d2841d8b0144fa5c996b38402b7255ba')

build() {
  cd async-executor-${pkgver}
  python setup.py build
}

package(){
  cd async-executor-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr --skip-build
}
