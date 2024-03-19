# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer:  Truocolo <truocolo@aol.com>

_py="python"
_pkg="mod"
pkgname="${_pkg}"
pkgver=0.3.0
pkgrel=1

_pkgdesc=(
  # I swear the emoji is from upstream
  "Modular arithmetic in Python 💯"
)
pkgdesc="${_pkgdesc[*]}"
arch=(
  'x86_64'
  'i686'
  'pentium4'
  'arm'
  'armv7h'
  'aarch64'
  'mips'
)
_http="https://github.com"
_ns="yoeo"
url="${_http}/${_ns}/${_pkg}"
license=(
  'MIT'
)
depends=(
  "${_py}"
)
optdepends=(
  # Let's keep one for reference
  # "${_py}-at-some-point-in-the-future"
)
makedepends=(
  "${_py}-setuptools"
  "${_py}-sphinx"
)
checkdepends=(
  # "${_py}-at-some-point-in-the-future"
)
provides=(
  "${_py}-${_pkg}=${pkgver}"
)
conflicts=(
  "${_py}-${_pkg}=${pkgver}"
)
_commit="df62c20c053024953a800b26d94599e10a1fdf38"

source=(
  "${pkgname}-${pkgver}.zip::${url}/archive/${_commit}.zip"
)
sha512sums=(
  '7453f214831741780b1da4a1952cbcef6389156b1398c643d15babee61df2d1f5a9cfcda8c6b11f2c13036668a8306948d30d1d6b2929f6825898e89b6e6971c'
)

build() {
  cd \
    "${_pkg}-${_commit}"
  "${_py}" \
    setup.py \
      build
}

package() {
  cd \
    "${_pkg}-${_commit}"
  "${_py}" \
    setup.py \
      install \
        --root="${pkgdir}" \
        --optimize=1
}

# vim:set sw=2 sts=-1 et:
