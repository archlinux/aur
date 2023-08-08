# Maintainer: Israel Roldan <israel.alberto.rv@gmail.com>
# Contributor: Israel Roldan <israel.alberto.rv@gmail.com>

# PKGBUILD variables.
pkgname=optional-packages
pkgver=1.0.2
pkgrel=1
pkgdesc='Command-line tool that finds all the optional packages of the packages that were pointed by you. It can install the packages.'
arch=(x86_64)
url='https://github.com/airvzxf/archlinux-optional-packages'
license=(GPL3)
depends=(
  bash
  pacman
  grep
  sed
  coreutils
  sudo
)
source=('archlinux-optional-packages-1.0.2.tar.gz::https://github.com/airvzxf/archlinux-optional-packages/archive/refs/tags/v1.0.2.tar.gz')
md5sums=('88c58db92ca179ba694ddae9937d1e6e')
validpgpkeys=(
  63ADA633FE7468630D9BC56175530B8B9F74CF3A # PGP: Israel Roldan (airvzxf) <israel.alberto.rv@gmail.com>, https://github.com/airvzxf.gpg
)

# PKGBUILD functions.
package() {
  cd "${srcdir}/archlinux-optional-packages-1.0.2" || return
  install -Dm644 README.md "${pkgdir}/usr/share/doc/optional-packages/README.md"
  install -Dm644 TODO.md "${pkgdir}/usr/share/doc/optional-packages/TODO.md"

  cd "src" || return
  install -Dm755 "optional-packages" "${pkgdir}/usr/bin/optional-packages"
}
