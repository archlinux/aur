# Maintainer: Joris Steyn <jorissteyn@gmail.com>
# Contributor: AndreasBWagner
# Contributor: Bernhard Walle <bernhard.walle@gmx.de>

pkgname=libmrss
pkgver=0.19.2
pkgrel=4
pkgdesc="C library for parsing, writing and creating RSS/ATOM files or streams"
url='https://github.com/bakulf/libmrss'
license=('LGPL2.1')
depends=('libcurl.so' 'libnxml')
arch=('x86_64')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::https://www.autistici.org/bakunin/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('071416adcae5c1a9317a4a313f2deb34667e3cc2be4487fb3076528ce45b210b')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
