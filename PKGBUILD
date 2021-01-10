# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-q2cli
pkgver=2021.2.0.dev0
pkgrel=1
pkgdesc="Command line interface for QIIME 2"
arch=('any')
url="https://qiime2.org"
license=('BSD')
depends=('python-qiime2' 'python-click')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/qiime2/q2cli/archive/${pkgver}.tar.gz")
sha256sums=('ca585deec8f963cc5c7b2f3bdcc5e5ebe87c72efd8d2638d583a89043b5ff4b3')

build() {
  cd "q2cli-$pkgver"
  python setup.py build
}

check() {
  cd "q2cli-$pkgver"
  python setup.py test || :
}

package(){
  cd "q2cli-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
