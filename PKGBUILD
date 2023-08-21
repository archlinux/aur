# Maintainer: Pellegrino Prevete (dvorak) <pellegrinoprevete@gmail.com>
# Contributor: Fabio Castelli (muflone) <webreg@muflone.com>

_pkgbase=ur
pkgbase="${_pkgbase}-git"
pkgname=(
  "${pkgbase}"
)
pkgdesc="(A)ur helper."
url="https://www.humaninstrumentalityproject.org"
pkgver=0.1
pkgrel=2
license=('AGPL3')
_ns="tallero"
_url="https://gitlab.archlinux.org/${_ns}/${_pkgbase}"
makedepends=(
  'git'
)
checkdepends=(
  'shellcheck'
)
optdepends=(
  'git'
)
arch=(
  any
)
_ns="tallero"
source=(
  "${pkgname}::git+${_url}.git"
)
sha256sums=(
  'SKIP'
)

check() {
  cd "${pkgname}"
  make -k check
}

package() {
  local _opts=()
  _opts=(
    DESTDIR="${pkgdir}"
    PREFIX='/usr'
  )
  cd "${pkgname}"
  make "${_opts[@]}" \
       install
}
