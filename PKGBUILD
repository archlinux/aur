# Maintainer: Israel Roldan <israel.alberto.rv@gmail.com>
# Contributor: Israel Roldan <israel.alberto.rv@gmail.com>

# PKGBUILD variables.
pkgname=optional-packages
pkgver=1.0.0
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
source=('archlinux-optional-packages-1.0.0.tar.gz::https://github.com/airvzxf/archlinux-optional-packages/archive/refs/tags/v1.0.0.tar.gz')
md5sums=('eed3c79629b56d62fd537ff188eef6b4')
validpgpkeys=(
  63ADA633FE7468630D9BC56175530B8B9F74CF3A # PGP: Israel Roldan (airvzxf) <israel.alberto.rv@gmail.com>, https://github.com/airvzxf.gpg
)

# PKGBUILD functions.
package() {
  cd "${srcdir}/archlinux-optional-packages-1.0.0" || return
  install -Dm644 README.md "${pkgdir}/usr/share/doc/optional-packages/README.md"

  cd "src" || return
  install -Dm755 "optional-packages" "${pkgdir}/usr/bin/optional-packages"
}
