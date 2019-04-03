# Maintainer: kpcyrd <git@rxv.cc>

_pyname="mt940"
pkgname="python-mt-940"
pkgver="4.15.0"
pkgrel=1
pkgdesc="A library to parse MT940 files and returns smart Python collections for statistics and manipulation"
arch=(any)
url="https://github.com/WoLpH/mt940"
license=('BSD')
makedepends=('python-setuptools')
source=("https://github.com/WoLpH/mt940/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('5f328e7bc80bcff716b9d8fe88dcc2c09aa4050c2ca7db5c3779219e9455dac0ade9e9ba440e48b4b73c126901d42d180b67a9e734ceef7b66e047885d486a5e')

build() {
  cd "${_pyname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
