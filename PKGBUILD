# Maintainer: Israel Roldan <israel.alberto.rv@gmail.com>
# Contributor: Israel Roldan <israel.alberto.rv@gmail.com>

# PKGBUILD variables.
pkgname=battery-discharging
pkgver=1.0.0
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
source=('archlinux-battery-discharging-1.0.0.tar.gz::https://github.com/airvzxf/archlinux-battery-discharging/archive/refs/tags/v1.0.0.tar.gz')
md5sums=('34e02970f178d7b725e6fefb2fe50496')
validpgpkeys=(
  63ADA633FE7468630D9BC56175530B8B9F74CF3A # PGP: Israel Roldan (airvzxf) <israel.alberto.rv@gmail.com>, https://github.com/airvzxf.gpg
)

# PKGBUILD functions.
package() {
  cd "${srcdir}/archlinux-battery-discharging-1.0.0" || return
  install -Dm644 README.md "${pkgdir}/usr/share/doc/battery-discharging/README.md"

  cd "src" || return
  install -Dm755 "battery-discharging" "${pkgdir}/usr/bin/battery-discharging"
}
