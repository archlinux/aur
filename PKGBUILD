# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=scxvid
pkgver=1
pkgrel=1
pkgdesc='Standalone port of the AviSynth SCXvid plugin'
arch=('i686' 'x86_64')
url='https://github.com/soyokaze/SCXvid-standalone'
license=('None')
depends=('glibc'
         'libxvidcore.so')
source=("https://github.com/soyokaze/SCXvid-standalone/archive/r${pkgver}.tar.gz")
sha256sums=('e178258cc5208c3bddc03fb881ee1ba8dac019b02f398167de8a20909f58ec14')

build() {
  cd SCXvid-standalone-r${pkgver}

  cc -lxvidcore -o scxvid scxvid.c
}

package() {
  cd SCXvid-standalone-r${pkgver}

  install -dm 755 "${pkgdir}"/usr/bin
  install -m 755 scxvid "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
