# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

_py="python"
_pkg=certbot-extra-formats
pkgname="${_pkg}"
pkgver=0.1
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
  'git'
  "${_py}-setuptools"
)
_commit="e9d5892bfada4edc043c26fc6f5714a9ecc461b2"
source=(
  "${_pkg}::git+${url}.git#commit=${_commit}"
)
sha512sums=(
  'SKIP'
)

pkgver() {
  cd "${_pkg}"
  git describe --tags | \
    sed 's/-/+/g'
}

package() {
    cd "${_pkg}"
    python3 setup.py \
	    install \
	    --root="${pkgdir}" \
	    --optimize=1
}

# vim:set sw=2 sts=-1 et:
