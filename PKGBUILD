# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname='python2-pyasn1'
_name="${pkgname#python2-}"
pkgver=0.4.8
pkgrel=5
pkgdesc='Pure-Python implementation of ASN.1 types and DER/BER/CER codecs (X.208)'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
_tarname="${_name}-${pkgver}"
source=("https://pypi.python.org/packages/source/${_name::1}/${_name}/${_tarname}.tar.gz")
b2sums=('5c00b47c2014e599d1aa2e14c3004b3688786c7afd160c85709d5a0f324166abb1d29ebbd9f3e13100166e7176710e4dc6e1b8fcf80db5f5bdaa202912f8a023')

check() {
  cd "${_tarname}"
  python2 setup.py test
}

package() {
  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}"
  install -Dm 644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
