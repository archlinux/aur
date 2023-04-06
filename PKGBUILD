# Maintainer: kpcyrd <git@rxv.cc>

_pyname="mt940"
pkgname="python-mt-940"
pkgver="4.29.0"
pkgrel=2
pkgdesc="A library to parse MT940 files and returns smart Python collections for statistics and manipulation"
arch=(any)
url="https://github.com/WoLpH/mt940"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/WoLpH/mt940/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('df177e1d9e96e49dbfaccce8561abcd5893bf634971c39972e375a2b07ba3d3b35fbaf73b2ce08ffe65831214c0bc2b61aa2f2bafa2d4d1d78701709e1af3fbd')
b2sums=('e397224273db59cfc5ead1025e57d3043bdbfdd2d6f56efe0594338ff8802a55b420168dc9c046ae775d88e6849207745454800f95e4d9858a99914ccca91ae6')

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
