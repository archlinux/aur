# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=flipse
pkgver=r23.9d4f4df
pkgrel=1
pkgdesc="Windowmaker Dockapps in one window"
arch=('i686' 'x86_64')
url="http://github.com/niklas/flipse"
license=('GPL3')
depends=('libxaw' 'libwnck')
makedepends=('git')
source=("$pkgname::git+https://github.com/niklas/flipse.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  install -Dm755 flipse "$pkgdir/usr/bin/flipse"
}


# vim: set sw=2 et:
