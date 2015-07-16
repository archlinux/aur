# Maintainer: Simon Gomizelj <simongmzlj@gmail.com>

pkgname=repose-git
pkgver=3.34.gc663937
pkgver() {
  cd "repose"
  git describe | sed 's/^v//;s/-/./g'
}
pkgrel=1
pkgdesc="A archlinux repo building tool"

arch=('i686' 'x86_64')
url="http://github.com/vodik/repose"
license=('GPL')
depends=('pacman' 'libarchive' 'gnupg')
makedepends=('git')
conflicts=('repose')
provides=('repose')
source=('git+git://github.com/vodik/repose.git')
sha1sums=('SKIP')

build() {
  make -C "repose"
}

package() {
  make -C "repose" DESTDIR="$pkgdir" install
}

# vim: ft=sh syn=sh et
