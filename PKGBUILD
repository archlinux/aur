# Maintainer: Israel Roldan <israel.alberto.rv@gmail.com>
# Contributor: Israel Roldan <israel.alberto.rv@gmail.com>

# PKGBUILD variables.
pkgname=brightness-xrandr
pkgver=1.0.0
pkgrel=1
pkgdesc='Command-line tool that changes the brightness using the xrandr command.'
arch=(x86_64)
url='https://github.com/airvzxf/archlinux-brightness-xrandr'
license=(GPL3)
depends=(
  bash
  xorg-xrandr
  grep
  coreutils
  sed
  bc
)
source=('archlinux-brightness-xrandr-1.0.0.tar.gz::https://github.com/airvzxf/archlinux-brightness-xrandr/archive/refs/tags/v1.0.0.tar.gz')
md5sums=('47db5b95540fa25738cfa7165abbd1a1')
validpgpkeys=(
  63ADA633FE7468630D9BC56175530B8B9F74CF3A # PGP: Israel Roldan (airvzxf) <israel.alberto.rv@gmail.com>, https://github.com/airvzxf.gpg
)

# PKGBUILD functions.
package() {
  cd "${srcdir}/archlinux-brightness-xrandr-1.0.0" || return
  install -Dm644 README.md "${pkgdir}/usr/share/doc/brightness-xrandr/README.md"

  cd "src" || return
  install -Dm755 "brightness-xrandr" "${pkgdir}/usr/bin/brightness-xrandr"
}
