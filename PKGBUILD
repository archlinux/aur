# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <archi@carsten-teibes.de>

pkgname=reicast
pkgver=r8.1
pkgrel=1
pkgdesc='A Sega Dreamcast emulator'
arch=(x86_64)
url=http://reicast.com/
license=(GPL2)
depends=(
  alsa-lib
  libgl
)
makedepends=(git)
source=(git+https://github.com/reicast/reicast-emulator.git#tag=${pkgver})
sha256sums=(SKIP)

build () {
  make -C reicast-emulator/shell/linux
}

package () {
  install -Dm 755 reicast-emulator/shell/linux/reicast.elf "${pkgdir}"/usr/bin/reicast
}

# vim: ts=2 sw=2 et:
