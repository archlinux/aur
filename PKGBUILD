# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xde-styles
pkgver=1.1.79
pkgrel=1
pkgdesc="Four consistent styles across light-weight WMs for XDE"
groups=('xde')
arch=('any')
license=('CCPL:by-sa')
url="http://github.com/bbidulock/xde-styles"
depends=('m4')
makedepends=('git')
source=("$pkgname::git://github.com/bbidulock/$pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --always | sed 's|-|.|g;s|[.]g[a-f0-9]*$||'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
 cd $pkgname
 ./configure --prefix=/usr --sysconfdir=/etc
 make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim: et sw=2:
