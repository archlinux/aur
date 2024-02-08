# SPDX-License-Identifier: AGPL-3.0
#
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Maintainer:  Truocolo <truocolo@aol.com>
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

_py="python2"
_pkg="backports-abc"
_Pkg="backports_abc"
pkgname="${_py}-${_pkg}"
pkgver=0.5
pkgrel=3
_pkgdesc=(
  "A backport of recent additions to"
  "the 'collections.abc' module."
)
pkgdesc="${_pkgdesc[*]}"
arch=(
  'any'
)
url="https://pypi.python.org/pypi/${_Pkg}"
license=(
  'PSF'
)
depends=(
  "${_py}"
)
makedepends=(
  "${_py}-setuptools"
)
_pypi="https://pypi.io/packages/source"
source=(
  "${_pypi}/${_pkg::1}/${_Pkg}/${_Pkg}-${pkgver}.tar.gz"
)
sha256sums=(
  '033be54514a03e255df75c5aee8f9e672f663f93abb723444caec8fe43437bde'
)

check() {
  cd \
    "${_Pkg}-${pkgver}"
  "${_py}" \
    tests.py
}

package() {
  cd \
    "${_Pkg}-${pkgver}"
  "${_py}" \
    setup.py \
      install \
        --root="${pkgdir}" \
	--optimize=1
}

# vim:set sw=2 sts=-1 et:
