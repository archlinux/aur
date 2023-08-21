# Maintainer: Pellegrino Prevete (dvorak) <pellegrinoprevete@gmail.com>

_pkg="misc"
pkgbase="ls-utils"
pkgname="${pkgbase}"
pkgdesc="Shortcuts for ls."
_ns="tallero"
url="https://github.com/${_ns}/${_pkg}"
pkgver=0.1
pkgrel=2
license=('AGPL3')
_ns="tallero"
makedepends=(
  'git')
checkdepends=(
  'shellcheck')
arch=(
  any
)
_commit="8ea0cb240d7b65491fcf4ca9e991b4bddbe24e64"
source=(
  "${_pkg}::git+${url}#commit=${_commit}"
)
sha256sums=(
  'SKIP'
)

check() {
  cd "${_pkg}"
  make -k check
}

package() {
  local _opts=()
  _opts=(
    DESTDIR="${pkgdir}"
    PREFIX='/usr'
  )
  cd "${_pkg}"
  make "${_opts[@]}" \
       install-ux
}
