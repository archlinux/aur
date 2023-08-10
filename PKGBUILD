# Maintainer: Pellegrino Prevete (dvorak) <pellegrinoprevete@gmail.com>
# Contributor: Fabio Castelli (muflone) <webreg@muflone.com>

pkgbase=ur
pkgname="${pkgbase}"
pkgdesc="(A)ur helper."
url="https://www.humaninstrumentalityproject.org"
pkgver=0.1
pkgrel=2
license=('AGPL3')
_ns="tallero"
_url="https://gitlab.archlinux.org/${_ns}/${pkgname}"
makedepends=('git')
checkdepends=('shellcheck')
arch=(
  any
)
_ns="tallero"
_commit="232180c2d04a2c5855061a2664a7cb4cdc77b295"
source=(
  "${pkgname}::git+${_url}#commit=${_commit}"
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
