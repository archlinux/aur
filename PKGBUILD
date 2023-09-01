# Maintainer: Israel Roldan <israel.alberto.rv@gmail.com>
# Contributor: Israel Roldan <israel.alberto.rv@gmail.com>

# PKGBUILD variables.
pkgname=optional-packages
pkgver=1.0.3
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
source=('archlinux-optional-packages-1.0.3.tar.gz::https://github.com/airvzxf/archlinux-optional-packages/archive/refs/tags/v1.0.3.tar.gz')
md5sums=('05beccf900b6dca9a150967a74d9c75b')
validpgpkeys=()

# PKGBUILD functions.
package() {
  cd "${srcdir}/archlinux-optional-packages-1.0.3" || return
  install -Dm644 README.md "${pkgdir}/usr/share/doc/optional-packages/README.md"
  install -Dm644 TODO.md "${pkgdir}/usr/share/doc/optional-packages/TODO.md"

  cd "src" || return
  install -Dm755 "optional-packages" "${pkgdir}/usr/bin/optional-packages"
}
