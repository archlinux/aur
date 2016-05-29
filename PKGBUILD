# Maintainer: Brian Hood <brianh6854@googlemail.com>
# Contributor: Benjamin van der Burgh <gringo@archlinux.info>

pkgname=monetdb
pkgver=11.21.19
pkgrel=1
pkgdesc="MonetDB version $pkgver"
arch=('i686' 'x86_64')
url="http://www.monetdb.org/Home"
license=('custom')
makedepends=('python' 'apache-ant' 'r-lang')
source=("http://dev.monetdb.org/downloads/sources/Latest/MonetDB-$pkgver.tar.xz")
sha256sums=("866a2976e0943227f07ab1a298199c422e92b582af1aaba92369203eb182e321")

build() {
  cd "$srcdir/MonetDB-$pkgver"
 # export RHOME=/usr/lib64/R
  ./configure --libdir=/usr/lib64 --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-assert \
      --disable-testing --enable-optimize --enable-rintegration
 make
}

package() {
  cd "$srcdir/MonetDB-$pkgver"
  make "DESTDIR=$pkgdir" install
}
