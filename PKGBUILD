#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgdesc="Airforce theme pack for XDE"
pkgname=xde-theme-airforce
pkgver=1.2.5
pkgrel=1
url="http://www.unexicon.com/"
license=('CCPL:by-nc-nd')
arch=('any')
groups=('xde')
makedepends=('git')
depends=('xde-styles')
source=("$pkgname::git://github.com/bbidulock/$pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  ./configure --version|head -1|awk '{print$3}'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
