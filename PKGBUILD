# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: carstene1ns <archi@carsten-teibes.de>

pkgname=reicast
pkgver=r7_rc1
pkgrel=1
pkgdesc='A Sega Dreamcast emulator'
arch=('x86_64')
url='http://reicast.com/'
license=('GPL2')
depends_i686=('alsa-lib' 'libgl')
depends_x86_64=('lib32-alsa-lib' 'lib32-libgl' 'lib32-alsa-lib')
source=("reicast-${pkgver/_/-}.tar.gz::https://github.com/reicast/reicast-emulator/archive/${pkgver/_/-}.tar.gz")
sha256sums=('f2ff9695ab04cedfee3446af5c6ab98b7e2d08f55726dde757fdfbbe88df8355')

build () {
  cd reicast-emulator-${pkgver/_/-}/shell/lin86

  make
}

package () {
  cd reicast-emulator-${pkgver/_/-}/shell/lin86

  install -dm 755 "${pkgdir}"/usr/bin
  install -m 755 reicast.elf "${pkgdir}"/usr/bin/reicast
}

# vim: ts=2 sw=2 et:
