# Maintainer: Arlo Siemsen <arkixml@gmail.com>
pkgname=gridmgr-git
pkgver=1.0
pkgrel=2
pkgdesc="command line tool which provides keyboard-bindable commands for easy window manipulation."
arch=('i686' 'x86_64')
url="http://nickbp.com/gridmgr/"
license=('GPL')
depends=('libxinerama')
conflicts=('gridmgr')
makedepends=('git' 'cmake')
source=("$pkgname::git://github.com/nickbp/gridmgr.git")
md5sums=('SKIP')

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
