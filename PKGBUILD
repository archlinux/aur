# Maintainer: Robin Visser <rxvisser *AT* gmail.com>
# Contributor: Kevin Mihelich <kevin *AT* archlinuxarm.org>
# Contributor: Alexander Lam <lambchop468 *AT* gmail.com>

pkgname=devmem
pkgver=2
pkgrel=1
pkgdesc="A simple program to read/write from/to any location in memory"
arch=('any')
url="http://free-electrons.com/pub/mirror/devmem2.c"
license=('GPL2')
source=("http://free-electrons.com/pub/mirror/${pkgname}${pkgver}.c")
sha256sums=('3b15515693bae1ebd14d914e46d388edfec2175829ea1576a7a0c8606ebbe639')

build() {
  cd "$srcdir/"
  gcc devmem2.c -o devmem2
}

package() {
  install -Dm755 "$srcdir/devmem2" "${pkgdir}/usr/bin/devmem2"
  ln -s devmem2 "${pkgdir}/usr/bin/devmem"
}

