# Maintainer: kpcyrd <git@rxv.cc>

_pyname="mt940"
pkgname="python-mt-940"
pkgver="4.28.0"
pkgrel=1
pkgdesc="A library to parse MT940 files and returns smart Python collections for statistics and manipulation"
arch=(any)
url="https://github.com/WoLpH/mt940"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/WoLpH/mt940/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('d4cf4d7e256ee307d02eb5971c2df69d809337117a6d01d6835a4958fb5e213ad5cfedb5e9c58d15397009af4a6865e747a320f5ac5539973f78c0934ca68b59')
b2sums=('ec501cae6a8eee6569bc0feefa2621cda33a8e08fd3f0cf61d243ec3e74b5436a344496922e09074883f1345402dbe2f77c95ce1c465caf4e94997915188d755')

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
