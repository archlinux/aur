# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=scu-bin
pkgver=2.1.0
pkgrel=1
_build=6560963780
pkgdesc="System fetch utility is aimed at informativeness"
arch=(x86_64)
url="https://gitlab.com/charidot/scu"
license=(GPL-3.0-or-later)
depends=(
  gcc-libs
  glibc
)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
source=(https://github.com/srtnnm/scu/releases/download/2.1.0/scu{,.md5sum})
b2sums=('f1bd1827d5a0b108b8e9af197a07c5e9eb84543d7be651af842f6ab9621300730f290d2697e19e0d7be591eaf328a6efce677daf9ede58828d074286790e3bdc'
        '9b344ab690e4f8202feb2694fe805998b0cddfec77e218195de0d7fcfa5e37b56981ae50beb9e57f6fddf7c94ae2cb470e32253c0fe35778eb52b7dcddc2f2f6')

prepare() {
  md5sum -c ${pkgname%-bin}.md5sum
}

package() {
  install -vDm755 ${pkgname%-bin} -t "$pkgdir"/usr/bin/
}
