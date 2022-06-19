# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
_profile=desktop
pkgname="archlinux-${_profile}"
pkgver=v1
pkgrel=1
pkgdesc='Builds an Archlinux desktop'
arch=('any')
license=('GPL3')
url="https://gitlab.archlinux.org/tallero/archiso-profiles"
depends=('archiso-profiles')
makedepends=('git')
checkdepends=('shellcheck')
source=("git+https://gitlab.archlinux.org/tallero/archiso-profiles")
sha256sums=('SKIP')

pkgver() {
  cd "archiso-profiles" || exit
  git describe --tags | sed 's/-/+/g'
}

package() {
  cd "archiso-profiles/${_profile}"
  bash build_repo.sh
  # Qemu is to be run
}
