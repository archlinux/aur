pkgname=python-pox
pkgver=0.2.8
pkgrel=1
pkgdesc="utilities for filesystem exploration and automated builds"
url="http://pox.rtfd.io/"
arch=(any)
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/uqfoundation/pox/archive/$pkgver.tar.gz")
sha1sums=('9662648d4e25b08ea3bbcd0876dfedc990cc6f7e')

build() {
  cd "pox-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/pox-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}

