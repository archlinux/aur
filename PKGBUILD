# Maintainer: Israel Roldan <israel.alberto.rv@gmail.com>
# Contributor: Israel Roldan <israel.alberto.rv@gmail.com>

# PKGBUILD variables.
pkgname=battery-discharging
pkgver=1.0.3
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
source=('archlinux-battery-discharging-1.0.3.tar.gz::https://github.com/airvzxf/archlinux-battery-discharging/archive/refs/tags/v1.0.3.tar.gz')
md5sums=('27cee12c7f07bee6eb815dc4e867b0f4')
validpgpkeys=(
  82DE44111B30F91F55BCEB1F414687A3CD7E65B9 # PGP: Israel Roldan (airvzxf) <israel.alberto.rv@gmail.com>, https://github.com/airvzxf.gpg
)

# PKGBUILD functions.
package() {
  cd "${srcdir}/archlinux-battery-discharging-1.0.3" || return
  install -Dm644 README.md "${pkgdir}/usr/share/doc/battery-discharging/README.md"

  cd "src" || return
  install -Dm755 "battery-discharging" "${pkgdir}/usr/bin/battery-discharging"
}
