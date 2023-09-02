# Maintainer: Israel Roldan <israel.alberto.rv@gmail.com>
# Contributor: Israel Roldan <israel.alberto.rv@gmail.com>

# PKGBUILD variables.
pkgname=brightness-xrandr
pkgver=1.0.6
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
source=('archlinux-brightness-xrandr-1.0.6.tar.gz::https://github.com/airvzxf/archlinux-brightness-xrandr/archive/refs/tags/v1.0.6.tar.gz')
md5sums=('07d2622e460d944e3021c021d7ff1d63')
validpgpkeys=(
  82DE44111B30F91F55BCEB1F414687A3CD7E65B9 # PGP: Israel Roldan (airvzxf) <israel.alberto.rv@gmail.com>, https://github.com/airvzxf.gpg
)

# PKGBUILD functions.
package() {
  cd "${srcdir}/archlinux-brightness-xrandr-1.0.6" || return
  install -Dm644 README.md "${pkgdir}/usr/share/doc/brightness-xrandr/README.md"

  cd "src" || return
  install -Dm755 "brightness-xrandr" "${pkgdir}/usr/bin/brightness-xrandr"
}
