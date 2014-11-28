# Maintainer: Dragonlord <dragonlord at seznam dot cz>
pkgname=mudix
pkgver=4.3
pkgrel=2
pkgdesc="MUDix is a lightweight and very stable MUD client for the linux console."
arch=('i686')
url="http://dw.nl.eu.org/mudix.html"
license="GPL"
depends=('ncurses')
source=(http://freebsd.unixfreunde.de/sources/$pkgname-$pkgver.tar.gz)
md5sums=('8a360b6fd1207c5aa4d8775c16a38705')

build() {
  cd $startdir/src/$pkgname-$pkgver

  ./configure --prefix=/usr
  make || return 1

  install -d "$startdir/pkg/usr/bin"
  install -d "$startdir/pkg/usr/share/mudix"
  install -m755 "$startdir/src/$pkgname-$pkgver/mudix" "$startdir/pkg/usr/bin/mudix"
  install -m644 "$startdir/src/$pkgname-$pkgver/sample.usr" "$startdir/pkg/usr/share/mudix/mudix.sample"
}
