# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=python-async-executor
pkgver=0.1.1
pkgrel=1
pkgdesc="Async execution pool"
url='https://github.com/nvllsvm/async-executor'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=(https://github.com/nvllsvm/async-executor/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('eb6303b599fb2638f0723158917cb383ee1cbe851bfd0012409eff1f475176584fdb63b7fa330df282c59520974f0f17172be45cb972b61b253a3db5220184fc')

build() {
  cd async-executor-${pkgver}
  python setup.py build
}

package(){
  cd async-executor-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr --skip-build
}
