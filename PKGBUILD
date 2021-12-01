# Maintainer: kpcyrd <git@rxv.cc>

_pyname="mt940"
pkgname="python-mt-940"
pkgver="4.23.0"
pkgrel=3
pkgdesc="A library to parse MT940 files and returns smart Python collections for statistics and manipulation"
arch=(any)
url="https://github.com/WoLpH/mt940"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/WoLpH/mt940/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('be778f0e7bb23d1eb1438ab1da00cb4d75275d7253c06e801b0b8bc4c1fa076fc0e1314d4527c34edb7a3cdb28cf452e5fe23bee5ec65f661ad5c2f76cf4fb37')
b2sums=('55dbfa387105c67c72c346a1cf2a8dfa796fca94cab71cdfe2ecc1efe62e649c1524cc257084cb11d359d8f4d72469c5ebb703a5de9d90a801b329d70b50b7c6')

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
