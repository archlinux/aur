# Maintainer: kpcyrd <git@rxv.cc>

pkgname="python-fints"
pkgver="2.0.0"
pkgrel=1
pkgdesc="Minimal pure-python FinTS (formerly known as HBCI) implementation"
arch=(any)
url="https://github.com/raphaelm/python-fints"
license=('LGPL')
depends=('python-mt-940')
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/raphaelm/python-fints/archive/v${pkgver}.tar.gz)
sha512sums=('72d834e41957464156625b636ad180f35521ca832a0323e67ef1bc0d911c96d2352b8b654e845c2e712b3c62ec5caf66ae8a61f25eb444244009412305638f70')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
