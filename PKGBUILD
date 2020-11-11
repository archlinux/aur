# Maintainer: kpcyrd <git@rxv.cc>

_pyname="mt940"
pkgname="python-mt-940"
pkgver="4.19.0"
pkgrel=4
pkgdesc="A library to parse MT940 files and returns smart Python collections for statistics and manipulation"
arch=(any)
url="https://github.com/WoLpH/mt940"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/WoLpH/mt940/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('6632bdf89b8acd44dab8861b88ec7b1976ca6a718acec28946385b7cc99147e7937d09e099c35383d1741c2fb05e2796e573327dbf06bd4b266da35a0cc00298')
b2sums=('647f6e9f4469da8a52bfea1ecb7491e4972ffb6c4612a9f259a2bb717707b04e66f4096fbebe7d165d2eb60279ee3493078bd6499a3d07dbd05c1ddb7e0a0d3f')

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
