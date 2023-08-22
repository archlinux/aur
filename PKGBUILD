# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

_py="python"
_pkg=certbot-extra-formats
pkgname="${_pkg}"
pkgver=0.1.3
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
_commit="78d0d2a89359e3d8ab6722bde5f04ccd13ef998f"
source=(
  "${_pkg}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha512sums=(
  "2798c77681ee8ea15eee8f2ca97a0f1da9802d2039ff47fc3a3bbea1416b57ea264476a5307626ee6875995852333a5c6d97b78db3cbbcb5668938831ebb774a"
)

package() {
    cd "${_pkg}-${pkgver}"
    "${_py}3" setup.py \
	      install \
	      --root="${pkgdir}" \
	      --optimize=1
}

# vim:set sw=2 sts=-1 et:
