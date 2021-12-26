#Maintainer : Michal Wojdyla < micwoj9292 at gmail dot com >
#Contributor: Brian Bidulock <bidulock@openss7.org>
pkgdesc="SR-71 Blackbird theme pack for XDE"
pkgname=xde-theme-blackbirds
pkgver=1.2.4
pkgrel=1
url="http://www.unexicon.com/"
license=('CCPL:by-nc-nd')
arch=('any')
groups=('xde')
depends=('xde-styles')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bbidulock/$pkgname/archive/refs/tags/$pkgver.tar.gz")
md5sums=('928a714279a3b6849932c55c7ff0c0e5')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
