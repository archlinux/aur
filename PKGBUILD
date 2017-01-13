# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=adtool
pkgver=1.3.3
pkgrel=1
pkgdesc='Active Directory administration utility for Unix'
arch=('x86_64' 'i686')
url="http://gp2x.org/adtool/"
license=('GPL2')
depends=('libldap')
source=("http://gp2x.org/adtool/adtool-${pkgver}.tar.gz")
md5sums=('7821eb551e0a122d934cc8f9b723f310')

prepare() {
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make V=0
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}

