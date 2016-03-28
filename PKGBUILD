# Maintainer: Paul Dann <pdgiddie at gmail dot com>
pkgname=multiwatch
pkgver='1.0.0'
pkgrel=1
pkgdesc='Forks and watches multiple instances of a program in the same context'
arch=('i686' 'x86_64')
url="http://redmine.lighttpd.net/projects/multiwatch/wiki"
license=('MIT')
depends=('libev')
makedepends=('cmake')
source=("http://download.lighttpd.net/multiwatch/releases-1.x/multiwatch-$pkgver.tar.bz2")
md5sums=('87f74dbaf5318f2b2dce3d0bf9f5025c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  rm -rf build
  mkdir build
  cd build
  cmake ..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  install -Dm 755 multiwatch $pkgdir/usr/bin/multiwatch
}

# vim:set ts=2 sw=2 et:
