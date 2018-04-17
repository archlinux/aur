# Maintainer: John Axel Eriksson <john@insane.se>
pkgname=spook-git
pkgver=0.9.4.r1.g2da76a1
pkgrel=1
pkgdesc='Spook is a lightweight evented file watcher and more for unix'
arch=('x86_64')
url='https://github.com/johnae/spook'
license=('MIT')
depends=('gcc-libs')
makedepends=('git')
source=(git+https://github.com/johnae/spook)
md5sums=('SKIP')
pkgver() {
  cd $srcdir/spook
  git checkout -q master
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
  cd spook
  git checkout -q master
  make
}
package() {
  cd spook
  make install DESTDIR=$pkgdir PREFIX=/usr
}