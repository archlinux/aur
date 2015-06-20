# Contributor: Eduardo Martins Lopes < edumlopes at gmail dot com >
# Contributor: Poco <poco@atelo.org> (Patched 0.5.4 with atmega16u2 support)
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=dfu-programmer
pkgver=0.7.2
pkgrel=1
pkgdesc='Programmer for Atmel chips with a USB bootloader'
arch=('i686' 'x86_64')
url='https://dfu-programmer.github.io/'
license=('GPL')
depends=('libusbx')
source=(
  "http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums=('4e1d8a09ade8b73ec94bf8d23ef8dc51d9ee7fe3')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
