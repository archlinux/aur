# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

_py="python2"
_pkg="pyasn1"
pkgname="${_py}-${_pkg}"
pkgver=0.4.8
pkgrel=5
pkgdesc='Pure-Python implementation of ASN.1 types and DER/BER/CER codecs (X.208)'
arch=('any')
url="https://pypi.org/project/${_pkg}/${pkgver}/"
license=('BSD')
depends=("${_py}")
makedepends=("${_py}-setuptools")
_tarname="${_pkg}-${pkgver}"
_pypi_url="https://pypi.python.org/packages/source"
source=(
  "${_pypi_url}/${_name::1}/${_pkg}/${_tarname}.tar.gz")
b2sums=(
  '5c00b47c2014e599d1aa2e14c3004b3688786c7afd160c85709d5a0f324166abb1d29ebbd9f3e13100166e7176710e4dc6e1b8fcf80db5f5bdaa202912f8a023'
)

check() {
  cd "${_tarname}"
  "${_py}" setup.py test
}

package() {
  cd "${_tarname}"
  "${_py}" setup.py install --root="${pkgdir}"
  install -Dm 644 LICENSE.rst \
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
