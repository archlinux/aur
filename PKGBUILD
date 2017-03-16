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
  "https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1db4d36b1aedab2adc976e8faa5495df3cf82dc4bf883633dc6ba71f7c4af995')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
