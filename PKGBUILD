# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_pkg=archiso
_variant="persistent"
_pkgname="${_pkg}-profiles"
pkgname="${_pkgname}-git"
pkgver=0.1
pkgrel=1
pkgdesc='Extra profiles for Archiso'
arch=('any')
license=('GPL3')
url="https://gitlab.archlinux.org/tallero/${_pkgname}"
depends=("${_pkg}-${_variant}-git")
makedepends=('git')
checkdepends=('shellcheck')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}")
sha256sums=('SKIP')

# shellcheck disable=SC2154
package() {
  local _profiles=$(ls "${srcdir}/${_pkgname}")
  local _dest="${pkgdir}/usr/share/${_pkg}/configs"
  local pkg
  install -dm755 "${_profiles_dir}"
  for pkg in "${_profiles[@]}"; do
    cp -r "${srcdir}/${pkg}" "${_dest}"
  done
}
