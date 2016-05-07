# Maintainer: Vincent Dahmen <4dahmen[at]informatik[dot]uni-hamburg.de> 

pkgname=nyancat-console-git
pkgver=0.0.8.224.0be8282
pkgrel=1
pkgdesc="lightweight port of 'nyancat lost in space'"
url="https://github.com/fanglingsu/nyancat-console/"
arch=('any')
license=('GPL3')
depends=('ncurses' )
makedepends=('git')
source=(${pkgname}::git+https://github.com/fanglingsu/nyancat-console)
sha256sums=('SKIP')


pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2)" \
  "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd ${pkgname}
  make
 }

package() {
  cd ${pkgname}
  install -d "$pkgdir/usr/bin"
  make PREFIX="$pkgdir/usr/" install
}

# vim: ts=2 sw=2 et:
