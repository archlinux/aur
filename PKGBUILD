# Maintainer: Israel Roldan <israel.alberto.rv@gmail.com>
# Contributor: Israel Roldan <israel.alberto.rv@gmail.com>

# PKGBUILD variables.
pkgname=battery-discharging
pkgver=1.0.2
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
source=('archlinux-battery-discharging-1.0.2.tar.gz::https://github.com/airvzxf/archlinux-battery-discharging/archive/refs/tags/v1.0.2.tar.gz')
md5sums=('8adada11ff737ca2cbd002fe8cb1bad5')
validpgpkeys=()

# PKGBUILD functions.
package() {
  cd "${srcdir}/archlinux-battery-discharging-1.0.2" || return
  install -Dm644 README.md "${pkgdir}/usr/share/doc/battery-discharging/README.md"

  cd "src" || return
  install -Dm755 "battery-discharging" "${pkgdir}/usr/bin/battery-discharging"
}
