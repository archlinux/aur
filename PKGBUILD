# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Juan Pablo Gonzalez Tognarelli <lord_jotape@yahoo.com.ar>

pkgname=cpptest
pkgver=1.1.2
pkgrel=2
pkgdesc="Portable and powerful unit testing framework for handling automated tests in C++"
url="http://cpptest.sourceforge.net"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('gcc-libs')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('79b9bff371d182f11a3235969f84ccb6')


build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

