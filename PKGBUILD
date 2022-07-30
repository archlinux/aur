# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
_base=straight.plugin
pkgname=python2-${_base}
pkgver=1.5.0
pkgrel=1
pkgdesc='A simple namespaced plugin facility'
arch=(any)
url="https://github.com/ironfroggy/${_base}"
license=(MIT)
depends=(python2)
makedepends=(python2-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('64652f90d6ef02b129b438bfe75781fd259e6ec081b32941c120a64e9591e344c2a0a86ad7b895731af3a95255b230631483eae1bdfe8bc5b21365907758766c')

build() {
  cd ${_base}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${_base}-${pkgver}
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
