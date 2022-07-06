# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_pkg=archiso
_pkgname="${_pkg}-profiles"
pkgname="${_pkgname}-git"
pkgver=0.1
pkgrel=1
pkgdesc='Extra profiles for Archiso'
arch=('any')
license=('GPL3')
url="https://gitlab.archlinux.org/tallero/${_pkgname}"
depends=("${_pkg}-persistent-git")
makedepends=('docbook-xsl' 'git' 'polkit' 'shfmt')
checkdepends=('shellcheck')
optdepends=()
source=("git+${url}")
sha256sums=('SKIP')

package() {
  # shellcheck disable=SC2154
  local _profiles_dir="${pkgdir}/usr/share/${_pkg}/configs"

  install -dm755 "${_profiles_dir}"

  # shellcheck disable=SC2154
  cp -r "${srcdir}/${_pkgname}/desktop" "${_profiles_dir}"
  cp -r "${srcdir}/${_pkgname}/ebaseline" "${_profiles_dir}"
  cp -r "${srcdir}/${_pkgname}/ereleng" "${_profiles_dir}"
}
