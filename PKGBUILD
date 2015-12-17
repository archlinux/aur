# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Paul Pletenev <cpp.create@gmail.com>
# Contributor: Ricardo Liang (rliang) <ricardoliang@gmail.com>

pkgname=gdmenu
pkgver=18
pkgrel=1
epoch=1
pkgdesc="GTK+ dmenu clone"
arch=('i686' 'x86_64')
url="https://github.com/rliang/gdmenu"
license=('MIT')
depends=('gtk3')
makedepends=('git')
source=('git+https://github.com/rliang/gdmenu.git')
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "%s" "$(git rev-list --count HEAD)"
}

build() {
  cd $pkgname
  unset LDFLAGS
  make
}

package() {
  cd $pkgname
  make PREFIX="$pkgdir/usr/" install
}
