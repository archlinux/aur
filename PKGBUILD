# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=beecrypt
pkgver=4.2.1
pkgrel=5
pkgdesc="A strong and fast cryptography toolkit"
arch=('i686' 'x86_64')
url="http://beecrypt.sourceforge.net/"
license=('LGPL')
depends=('icu')
makedepends=('automake' 'python2')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('8441c014170823f2dff97e33df55af1e')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  CXXFLAGS=-fpermissive
  ./configure --prefix=/usr --sysconfdir=/etc --without-java --disable-openmp --with-python=python2
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver

  make DESTDIR=${pkgdir} install
}
