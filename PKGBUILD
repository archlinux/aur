# Maintainer: kpcyrd <git@rxv.cc>

pkgname="python-fints"
pkgver="2.0.1"
pkgrel=1
pkgdesc="Minimal pure-python FinTS (formerly known as HBCI) implementation"
arch=(any)
url="https://github.com/raphaelm/python-fints"
license=('LGPL')
depends=('python-mt-940')
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/raphaelm/python-fints/archive/v${pkgver}.tar.gz)
sha512sums=('c919b5c4141a9bdd3826f4cbaf59d4f8543bb5edb8b42a2238f4c0a138eebf3f5ecdf92e9f4bb4d22e20409f7f9766af831122944531b0bf12d31a40e4a83c1e')

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
