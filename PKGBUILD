# Maintainer: Simon Gomizelj <simongmzlj@gmail.com>

pkgname=repose-git
pkgver=7.1
pkgrel=1
pkgdesc="A archlinux repo building tool"
arch=('i686' 'x86_64' 'armv7h')
url="http://github.com/vodik/repose"
license=('GPL')
depends=('pacman' 'libarchive' 'gnupg')
makedepends=('git' 'ragel')
checkdepends=('python-cffi' 'python-pytest' 'python-pytest-xdist')
conflicts=('repose')
provides=('repose')
source=('git+git://github.com/vodik/repose.git')
sha1sums=('SKIP')

pkgver() {
  cd "repose"
  git describe | sed 's/^v//;s/-/./g'
}

build() {
  make -C "repose"
}

check() {
  make -C "repose" tests
}

package() {
  make -C "repose" DESTDIR="$pkgdir" install
}

# vim: ft=sh syn=sh et
