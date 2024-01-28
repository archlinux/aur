# Maintainer: János Illés <ijanos@gmail.com>
pkgname=desktend-git
pkgver=20110815
pkgrel=1
pkgdesc="automatic virtual desktop extender for X11"
arch=('i686' 'x86_64')
url="https://github.com/ijanos/desktend"
license=('GPL')
depends=('libx11')
md5sums=('SKIP')
source=("git+https://github.com/ijanos/desktend.git")

build() {
  cd "${srcdir}/desktend"
  gcc -lX11 -std=gnu99 -o desktend -O2 desktend.c
  strip desktend
}

package() {
  cd "${srcdir}/desktend"
  install -D desktend "${pkgdir}/usr/bin/desktend"
}

# vim:set ts=2 sw=2 et:
