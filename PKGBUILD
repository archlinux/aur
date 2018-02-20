# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python2-pico
_pkgname=pico-python
pkgver=0.6.4
pkgrel=1
pkgdesc="PicoScope Python Interface"
arch=('any')
url="https://github.com/colinoflynn/pico-python"
license=('BSD 2-Clause')
depends=('python2')
makedepends=('python2-setuptools')
source=(https://github.com/colinoflynn/pico-python/archive/${pkgver}.tar.gz)
md5sums=('ac1cf31c014e88730a7854e4e4f572bc')

#prepare() {
#  cp -r "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}-py2"
#  # change python to python2
#  find "${_pkgname}-${pkgver}-py2" -name '*.py' -type f -exec \
#      sed -i 's|env python|env python2|' {} \;
#}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
