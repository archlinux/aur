# Maintainer: kpcyrd <git@rxv.cc>

_pyname="mt940"
pkgname="python-mt-940"
pkgver="4.30.0"
pkgrel=1
pkgdesc="A library to parse MT940 files and returns smart Python collections for statistics and manipulation"
arch=(any)
url="https://github.com/WoLpH/mt940"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/WoLpH/mt940/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('f6b79e6296baaca080448b36b7b7d366e8e7fc58806c58139ea07e31bd428859ee3231e126c44155d6badb26559db89a1f73bfa5bab1d916962214b8d3c5d343')
b2sums=('c1a90c80f30f3540705a3dc79848f1e563652934d7da297e9542220be02ce26e65268bc98e5361cd6197bb84244285a9dae95f53c04402ec9ec00192305ee0ad')

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
