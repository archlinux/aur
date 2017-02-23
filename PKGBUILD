# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
_pyname=pydeep
pkgname=('python2-pydeep')
makedepends=('python2')
depends=('ssdeep')
pkgver=0.2
pkgrel=2
pkgdesc="bindings for ssdeep"
arch=('i686' 'x86_64')
url="https://github.com/kbandla/pydeep/"
license=('BSD')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/kbandla/${_pyname}/archive/${pkgver}.tar.gz")
sha512sums=('debdf24fd62143c1a3a780fcfd36824e3e18e95f110ba3ca298cb3a0f6a761d71c4c6394283d5da7ddf0fa5943ffe4d7b23c7097f46e806d9eb7724b2ad2406f')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/doc/pydeep/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/licenses/pydeep/README.md"
}

# vim:set et sw=2 ts=2 tw=79:
