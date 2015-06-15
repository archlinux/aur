#! /bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Alois Nespor <alois.nespor@gmail.com>

pkgname=gnomad2
pkgver=2.9.6
pkgrel=3
pkgdesc="GTK client program for the NOMAD Jukebox with MTP support"
arch=('i686' 'x86_64')
url="http://gnomad2.sourceforge.net"
license=('GPL')
depends=('desktop-file-utils' 'libusb' 'libnjb' 'libid3tag' 'gtk2' 'libmtp' 'taglib')
makedepends=('intltool')
optdepends=('dbus-glib: for device autodetection')
install=$pkgname.install   
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('10f025ac38089ebc4a063ac25a262d3e2f6b72336c4566877fae311a873923b55d532d210fd2ec8a29013c06c806ddacc50f042546e4aaa5cf23228d09d854a1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
