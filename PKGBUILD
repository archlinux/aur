# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>

pkgname=tcludp
pkgver=1.0.11
pkgrel=1
pkgdesc="This package provides UDP sockets for Tcl."
url="https://core.tcl-lang.org/tcludp"
arch=('i686' 'x86_64')
license=('MIT')
depends=('tcl')
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a8a29d55a718eb90aada643841b3e0715216d27cea2e2df243e184edb780aa9d')

build() {
  cd $srcdir/$pkgname
  ./configure --prefix=/usr
  make
}
package() {
  cd $srcdir/$pkgname
  make DESTDIR=$pkgdir install
  install -d $pkgdir/usr/share/doc/$pkgname
  cp -r doc/* $pkgdir/usr/share/doc/$pkgname
}
