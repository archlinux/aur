# Maintainer: willemw <willemw12@gmail.com>

_pkgname=altyo
pkgname=$_pkgname-git
pkgver=0.4_rc12.1.r16.g777b7ad
pkgrel=1
pkgdesc="Vala / GTK+ 3 drop-down terminal emulator"
arch=('i686' 'x86_64')
url="https://github.com/linvinus/AltYo"
license=('GPL3')
#depends=('gtk-update-icon-cache' 'vte290')
depends=('gtk-update-icon-cache' 'vte3')
makedepends=('git' 'vala')
provides=($_pkgname)
conflicts=($_pkgname)
install=$pkgname.install
source=($pkgname::git://github.com/linvinus/AltYo.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/^debian\///;s/\-linvinus[0-9]?//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

