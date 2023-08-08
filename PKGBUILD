# Maintainer: Israel Roldan <israel.alberto.rv@gmail.com>
# Contributor: Israel Roldan <israel.alberto.rv@gmail.com>

# PKGBUILD variables.
pkgname=battery-discharging
pkgver=1.0.1
pkgrel=1
pkgdesc='Command-line tool that makes a sound whenever the computer battery is not connected to electrical power.'
arch=(x86_64)
url='https://github.com/airvzxf/archlinux-battery-discharging'
license=(GPL3)
depends=(
  bash
  coreutils
  grep
  alsa-utils
  util-linux
)
source=('archlinux-battery-discharging-1.0.1.tar.gz::https://github.com/airvzxf/archlinux-battery-discharging/archive/refs/tags/v1.0.1.tar.gz')
md5sums=('b1b8eed01c16a27a13c05b4665d904c9')
validpgpkeys=(
  63ADA633FE7468630D9BC56175530B8B9F74CF3A # PGP: Israel Roldan (airvzxf) <israel.alberto.rv@gmail.com>, https://github.com/airvzxf.gpg
)

# PKGBUILD functions.
package() {
  cd "${srcdir}/archlinux-battery-discharging-1.0.1" || return
  install -Dm644 README.md "${pkgdir}/usr/share/doc/battery-discharging/README.md"

  cd "src" || return
  install -Dm755 "battery-discharging" "${pkgdir}/usr/bin/battery-discharging"
}
