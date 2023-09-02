# Maintainer: Israel Roldan <israel.alberto.rv@gmail.com>
# Contributor: Israel Roldan <israel.alberto.rv@gmail.com>

# PKGBUILD variables.
pkgname=optional-packages
pkgver=1.0.4
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
source=('archlinux-optional-packages-1.0.4.tar.gz::https://github.com/airvzxf/archlinux-optional-packages/archive/refs/tags/v1.0.4.tar.gz')
md5sums=('bb41edc2d9a60bbb3aa0009c2c998d9c')
validpgpkeys=(
  82DE44111B30F91F55BCEB1F414687A3CD7E65B9 # PGP: Israel Roldan (airvzxf) <israel.alberto.rv@gmail.com>, https://github.com/airvzxf.gpg
)

# PKGBUILD functions.
package() {
  cd "${srcdir}/archlinux-optional-packages-1.0.4" || return
  install -Dm644 README.md "${pkgdir}/usr/share/doc/optional-packages/README.md"
  install -Dm644 TODO.md "${pkgdir}/usr/share/doc/optional-packages/TODO.md"

  cd "src" || return
  install -Dm755 "optional-packages" "${pkgdir}/usr/bin/optional-packages"
}
