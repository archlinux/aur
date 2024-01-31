# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Daniel Peukert <daniel@peukert.cc>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Kevin Houdebert <kevin@qwazerty.eu>
# Contributor: Erhan SAHIN <erhan@ssahin.net>

_py='python2'
_pkg='monotonic'
pkgname="${_py}-monotonic"
pkgver=1.6
pkgrel=2
_pkgdesc=(
  'An implementation of time.monotonic()'
  '(legacy Python 2 version)'
)
pkgdesc="${_pkgdesc[*]}"
arch=('any')
url="https://pypi.org/project/${_pkg}/${pkgver}/"
license=('Apache')
depends=(
  'python2'
)
makedepends=(
  'python2-setuptools'
)
_tar="${_pkg}-${pkgver}"
_url="https://github.com/atdt/${_pkg}"
source=(
  "${_tar}.tar.gz::${_url}/archive/${pkgver}.tar.gz"
)
sha256sums=(
  '9609c249aed584fd714811014870650d08d6f6414402b5a190663c49bf83b221'
)

build() {
    cd \
      "${_tar}"
    "${_py}" \
      setup.py \
        build
}

package() {
    cd \
      "${_tar}"
    "${_py}" \
      setup.py \
        install \
          --root="${pkgdir}" \
          --optimize=1 \
          --skip-build
}

# vim:set sw=2 sts=-1 et:
