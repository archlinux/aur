# Maintainer: redponike <proton (dot) me>

_name=orange3-network
pkgname=python-orange-network
pkgver=1.10
pkgrel=1
pkgdesc="Network analysis add-on for Orange data mining suite. Orange3 add-on."
arch=('x86_64')
url="https://github.com/biolab/orange3-network"
license=('GPL-2.0')
makedepends=('python-setuptools' 'python-trubar')
depends=('python-orange' 'python-gensim')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/biolab/orange3-network/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c5406267a61493271db3ce5925039ab3139850c2cebd6d91745e88177faa8dab')

build() {
  cd "${_name}-$pkgver"
  python setup.py build
}

package() {
  cd "${_name}-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
