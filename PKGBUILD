# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Truocolo <truocolo@aol.com>
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Contributor: Oskar Roesler <oskar at oskar-roesler dot de>

_py="python2"
_pkg="ipaddress"
pkgname="${_py}-${_pkg}"
pkgver=1.0.23
pkgrel=2
pkgdesc="IPv4/IPv6 manipulation library"
arch=(
  any
)
_http="http://github.com"
_ns="phihag"
url="${_http}/${_ns}/${_pkg}"
license=(
  'custom:PSF'
)
depends=(
  "${_py}"
)
makedepends=(
  "${_py}-setuptools"
)
_pypi="https://pypi.io/packages/source"
source=(
  "${_pypi}/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz")
sha512sums=(
    '340e2a8698df1868038f55889671442eba17f06ec3f493759d8d0a9bf406eefbe1f67c14ca616f52e5bf2280942dcece7e89fb19de0923bee1ee20e60f48896e'
  )

package() {
  cd \
    "${_pkg}-${pkgver}"
  "${_py}" \
    setup.py \
      install \
        --root="${pkgdir}" \
        --optimize=1
}

# vim:set sw=2 sts=-1 et:
