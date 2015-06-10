#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgdesc="XDG application menu with full support for FVWM"
pkgname=fvwm-xdg-menu-git
_pkgname=fvwm-xdg-menu
pkgver=r51.g4b49473
pkgrel=1
arch=(any)
license=(GPL2)
url="http://github.com/domichel/$_pkgname"
groups=('xde')
depends=('gtk-update-icon-cache')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$pkgname::git://github.com/domichel/$_pkgname.git")
md5sums=('SKIP')
makedepends=('git')
install=$_pkgname.install

pkgver() {
  cd $pkgname
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr install
}

# vim: et sw=2:
