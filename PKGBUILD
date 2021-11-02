pkgname=python-pox
pkgver=0.3.0
pkgrel=1
pkgdesc="utilities for filesystem exploration and automated builds"
url="https://github.com/uqfoundation/pox"
arch=(any)
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/uqfoundation/pox/archive/refs/tags/pox-$pkgver.tar.gz")
sha256sums=('c228f129e99cc871f25ec8c0c366c53ba773aa51613914e21581362c615e13d3')

build() {
  cd pox-pox-${pkgver}
  python setup.py build
}

package() {
  cd pox-pox-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

