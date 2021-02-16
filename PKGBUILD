# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
# Configure: jurmc <jurmc@jurmc.mydevil.net>
# Contributor: Piotr Kujawski <piotr@lao.pl>

pkgname=libydpdict
pkgver=1.0.4
pkgrel=3
pkgdesc="Interface for Polish-English Collins Dictionary (library)"
url='https://github.com/wojtekka/libydpdict'
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
groups=(office)
depends=(glibc)
# source=(http://toxygen.net/ydpdict/$pkgname-$pkgver.tar.gz)
source=($url/releases/download/$pkgver/libydpdict-$pkgver.tar.gz)
sha256sums=('37dcbc12def981a20728bdcb6a5ff1eef8931f29a0f16852f0b2201ff8563528')

build() {
	cd $srcdir/$pkgname-$pkgver
	./autogen.sh --prefix=/usr
# 	./configure --prefix=/usr
	make
}
package() {
  cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
