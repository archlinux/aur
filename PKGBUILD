# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xdg-launch
pkgver=0.1.25
pkgrel=2
pkgdesc="A command line XDG compliant launcher"
arch=('i686' 'x86_64')
url="http://github.com/bbidulock/xdg-launch"
license=('GPL')
groups=('xde')
depends=('libxrandr' 'libxinerama')
options=('!libtool')
makedepends=('git' 'pkgconfig')
source=("$pkgname::git+https://github.com/bbidulock/xdg-launch")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
	git describe --tags|sed 's,[-_],.,g;s,\.g.*$,,'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
