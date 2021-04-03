# Maintainer: Frederic Bezies <fredbezies at gmail dot com>

pkgname=fake86-git
pkgver=2020.05.09.gd275349
pkgrel=2
pkgdesc="An 8086 PC emulator written in C - git version"
arch=('i686' 'x86_64')
url="https://github.com/lgblgblgb/fake86.git"
license=('GPL2')
depends=('sdl2')
makedepends=('git')
provides=(fake86)
conflicts=(fake86)
source=("fake86::git+https://github.com/lgblgblgb/fake86.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/fake86"
  git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

build() {
  cd "$srcdir/fake86"
  make
}

package() {
  cd "$srcdir/fake86"
  install -d "$pkgdir"/usr/bin
  cp bin/data/asciivga.dat bin/data/pcxtbios.bin bin/data/videorom.bin bin/data/rombasic.bin "$pkgdir"/usr/bin
  cp bin/fake86* "$pkgdir"/usr/bin
  
}

# vim:set ts=2 sw=2 et:
