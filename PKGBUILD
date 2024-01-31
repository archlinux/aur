# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Bao Trinh <qubidt at gmail dot com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Sebastien Leduc <sebastien@sleduc.fr>

_py="python2"
_pkg="trollius"
pkgname="${_py}-${_pkg}"
_realname=trollius
pkgver=2.2.1
pkgrel=1
_pkgdesc=(
  "Port of the Tulip project"
  "(asyncio module, PEP 3156) on Python 2.7"
)
pkgdesc="${_pkgdesc[*]}"
arch=(
  "any"
)
url="http://${_pkg}.readthedocs.org"
license=(
  'APACHE'
)
depends=(
  "${_py}"
  "${_py}-futures"
  "${_py}-six"
)
optdepends=(
  "${_py}-unittest2: to pass ${_pkg} unit tests"
)
_pypi="https://pypi.python.org/packages/source"
source=(
  "${_pypi}/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz"
)
sha512sums=(
  '36ebc6a4125ec8a2f8b0093c1528f253e26725ffdeccb45bc9ddb51a4658c05b1b08fa5898e94b2008e49e65175ecb149aa9127bd8a986086b6d7e5fc95313c8'
)

build() {
  cd \
    "${srcdir}/${_pkg}-${pkgver}"
  "${_py}" \
    setup.py \
      build
}

package() {
  cd \
    "${srcdir}/${_pkg}-${pkgver}"
  "${_py}" \
    setup.py \
      install \
        --root="${pkgdir}" \
        --optimize=1 \
        --skip-build
}

# vim:set sw=2 sts=-1 et:
