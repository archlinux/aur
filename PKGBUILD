# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pkgbase=archiso
_pkgname="${_pkgbase}-profiles"
pkgname="${_pkgname}-git"
pkgver=0.1
pkgrel=1
pkgdesc='Extra profiles for Archiso'
arch=('any')
license=('GPL3')
url="https://gitlab.archlinux.org/tallero/${pkgname}"
depends=("${_pkgbase}-persistent-git")
makedepends=('docbook-xsl' 'git' 'shfmt')
checkdepends=('shellcheck')
optdepends=()
source=("git+${url}")
sha256sums=('SKIP')

package() {
  local _profiles_dir="${pkgdir}/usr/share/${_pkgbase}/configs"

  install -dm755 "${_profiles_dir}"
  cp -r "${srcdir}/${_pkgname}/desktop" "${_profiles_dir}"
  cp -r "${srcdir}/${_pkgname}/ebaseline" "${_profiles_dir}"
  cp -r "${srcdir}/${_pkgname}/ereleng" "${_profiles_dir}"
}
