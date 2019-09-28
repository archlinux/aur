# Maintainer: kpcyrd <git@rxv.cc>
# Contributor: Eliot Whalan <ewhal at pantsu dot cat>

_pyname="pure-python-otr"
pkgname=python-potr
pkgver=1.0.2
pkgrel=1
pkgdesc="Pure python OTR implementation without libotr"
arch=(any)
url="https://github.com/afflux/pure-python-otr"
license=('LGPL')
depends=('python' 'python-crypto')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-rednose')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/afflux/pure-python-otr/archive/${pkgver}.tar.gz")
sha512sums=('e35f6ea7db64af92a966b22857a1a670a1c930aa01a1bc88d5ba7e4ba62100808c193fbccbbde4d29039610a383b374c95a090fd98b208890c721e01bba87fb8')

build() {
  cd "${_pyname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_pyname}-${pkgver}"
  # tests are currently broken (https://github.com/python-otr/pure-python-otr/issues/75)
  #./run_tests.sh
}

package() {
  cd "${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}" --skip-build
}

# vim:set ts=2 sw=2 et:
