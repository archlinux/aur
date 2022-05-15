# Maintainer: kpcyrd <git@rxv.cc>

_pyname="mt940"
pkgname="python-mt-940"
pkgver="4.26.0"
pkgrel=1
pkgdesc="A library to parse MT940 files and returns smart Python collections for statistics and manipulation"
arch=(any)
url="https://github.com/WoLpH/mt940"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/WoLpH/mt940/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('682e0c5ca9be8d4da1bfb02baeb7031c4bb061fa0ba1789d67f6739d3b30e5f4a11fab05a47eada8407e0b16594194530a681ec25f5b9164f52961bd311ce39c')
b2sums=('a4afd03c95877b25678e3b909db0c615bac6a0e58d9ad31c2821d59faaac120c236e56a04e65214467c7a9d1dc9cd84299b28f67f7be4081fd72ccface67cbb0')

build() {
  cd "${_pyname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}" --skip-build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
