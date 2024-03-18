# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer:  Truocolo <truocolo@aol.com>

_py="python"
_pkg="grok"
pkgname="${_pkg}"
pkgver=0.0.1
pkgrel=1
_pkgdesc=(
  ohoh
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
_ns="openai"
url="${_http}/${_ns}/${_pkg}"
license=(
  'custom'
)
depends=(
  "${_py}-pytorch_lightning"
  "${_py}-blobfile"
  "${_py}-numpy"
  "${_py}-torch"
  "${_py}-tqdm"
  "${_py}-scipy"
  "${_py}-mod"
  "${_py}-matplotlib"
)
optdepends=(
  # Let's keep one for reference
  # "${_py}-at-some-point-in-the-future"
)
makedepends=(
  "${_py}-setuptools"
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
_commit="3d64b1d8c1d595dd8ebdb7771998823f1b14c7b3"
source=(
  "${pkgname}-${pkgver}.zip::${url}/archive/${_commit}.zip"
)
sha512sums=(
  '84477d2dc873a98d879fe26c35da7d97cd1be72463c4a62c1279ae9a434de3d4c4728c473c05697efbfa4a2c0a34e6514ea2cbde53a3ec546e20aa04d5cc5644'
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
