# Maintainer: kpcyrd <git@rxv.cc>

_pyname="mt940"
pkgname="python-mt-940"
pkgver="4.27.0"
pkgrel=1
pkgdesc="A library to parse MT940 files and returns smart Python collections for statistics and manipulation"
arch=(any)
url="https://github.com/WoLpH/mt940"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/WoLpH/mt940/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('74ba62c6ff1f8461849e305b06c9594f6b75577acb9a1e83d7c5e09211ba9fa8773e61f0420f8d5ee2fb95d89c68092231d5b81b9be05a55950c9a9c7453da21')
b2sums=('0e716bd20ace33adbd84ce9bc53a3edcc8afe0b57a9cbdb1e27d6519146749c7376fbb8e9f523629c5560477dd4e304c7a0319e64bb93fe0ab6389a6ca09e67b')

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
