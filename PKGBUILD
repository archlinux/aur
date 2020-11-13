# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname="python-fints"
pkgver="3.0.0"
pkgrel=2
pkgdesc="Minimal pure-python FinTS (formerly known as HBCI) implementation"
arch=(any)
url="https://github.com/raphaelm/python-fints"
license=('LGPL')
depends=('python' 'python-mt-940' 'python-bleach' 'python-sepaxml' 'python-requests')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/raphaelm/python-fints/archive/v${pkgver}.tar.gz")
sha512sums=('f82e035bd887f04950d5bf18fead00610f5765d186db40a00ed6da9c8e9245e33f7a9fc4a9d13e846caccef7c78038fd6af4275fa06f14bcd9ab7c537c01c1ae')
b2sums=('d3726decae6cf9e8cec7f374b89a968ae5ca27d6622eee812c5ce60911f90eabae86c9401dac4da1274deb9e4afde2419975bad97ea80419ee5226374b8444a8')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  PYTHONPATH=. pytest
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}" --skip-build
}

# vim:set ts=2 sw=2 et:
