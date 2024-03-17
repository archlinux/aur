# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Arlo Siemsen <arkixml@gmail.com>
pkgname=gridmgr-git
pkgver=r30.44be97c
pkgrel=1
pkgdesc="command line tool which provides keyboard-bindable commands for easy window manipulation."
arch=('i686' 'x86_64')
url="http://nickbp.com/gridmgr/"
license=('GPL')
depends=('libxinerama')
provides=('gridmgr')
conflicts=('gridmgr')
makedepends=('git' 'cmake')
source=("$pkgname::git+https://github.com/nickbp/gridmgr.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  cmake src
  make
}

package() {
  cd $pkgname
  install -Dm755 gridmgr "${pkgdir}/usr/bin/gridmgr"
}

# vim:set ts=2 sw=2 et:
