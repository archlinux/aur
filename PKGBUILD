# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

_py="python"
_pkg=certbot-extra-formats
pkgname="${_pkg}"
pkgver=0.1.4
pkgrel=1
_pkgdesc=(
  "Combine and write 'Let's encrypt'"
  "certificates compatible with a given application.")
pkgdesc="${_pkgdesc[*]}"
_ns="tallero"
url="https://github.com/${_ns}/${_pkg}"
license=(
  'AGPLv3'
)
arch=(
  'any'
)
depends=(
  "certbot"
)
makedepends=(
  "${_py}-setuptools"
)
provides=(
  "${_py}-${_pkg}"
  "${_py}3-${_pkg}"
)
source=(
  "${_pkg}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=(
  "fba59f0611f8e1896ec779c812968e40418c606601d7770542340bb529330843"
)

package() {
    cd "${_pkg}-${pkgver}"
    "${_py}3" setup.py \
	      install \
	      --root="${pkgdir}" \
	      --optimize=1
}

# vim:set sw=2 sts=-1 et:
