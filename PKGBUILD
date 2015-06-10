# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=cairo-msg
pkgver=r14.a39942e
pkgrel=1
pkgdesc="A small splash program for UNIX like OS"
arch=(i686 x86_64)
license=('GPL2')
url="https://github.com/01micko/cairo-msg"
depends=('cairo')
makedepends=('git')
source=("$pkgname::git+https://github.com/01micko/cairo-msg.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd $pkgname
  make
}
package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
