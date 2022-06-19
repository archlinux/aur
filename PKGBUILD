# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=archiso-profiles
pkgver=0.1
pkgrel=1
pkgdesc='Tools for creating Arch Linux live and install iso images with luks'
arch=('any')
license=('GPL3')
url="https://gitlab.archlinux.org/tallero/${pkgname}"
depends=('archiso-encryption')
makedepends=('git')
checkdepends=('shellcheck')
optdepends=()
_commit="a53522b593b5675c24fc1e7132bb631f21a90291"
source=("git+${url}#commit=${_commit}")
sha256sums=('SKIP')

package() {
  local _profiles_dir="${pkgdir}/usr/share/archiso/configs"

  install -dm755 "${_profiles_dir}"
  cp -r "${srcdir}/${pkgname}/ebaseline" "${_profiles_dir}"
  cp -r "${srcdir}/${pkgname}/ereleng" "${_profiles_dir}"
}
