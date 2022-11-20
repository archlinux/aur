# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python38-tblib
_pyname=tblib
pkgver=1.7.0
pkgrel=5
pkgdesc='Python traceback fiddling library'
url='https://github.com/ionelmc/python-tblib'
arch=('any')
license=('BSD')
depends=('python38-six')
makedepends=('python38-setuptools' 'python38-six')
source=(https://github.com/ionelmc/python-tblib/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('14745af9647262c4569ae578e2bd439b4fbc430735449bf3c4dbc99c6dd39706725ddbf5b6d6e078eee34f0ccb5d9a5f5143d133a2a0b171afa6975e21c30999')
b2sums=('edbd9e475304b6486072ef86147a65c0a8f540dc821a0f7e8babd72386276246b64d3d04f4fbb89edb34164965746e999694fba5d5b65f71b8ce3e8cfddb0add')

build() {
  cd ${pkgbase}-${pkgver}
  python3.8 setup.py build
}

check() {
  cd ${pkgbase}-${pkgver}
  python3.8 setup.py test
}

package() {
  cd ${pkgbase}-${pkgver}
  python3.8 setup.py install -O1 --root="${pkgdir}" --prefix=/usr --skip-build
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
