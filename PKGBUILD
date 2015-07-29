# Contributor: Beej Jorgensen <beej@beej.us>
# Maintainer: Beej Jorgensen <beej@beej.us>
pkgname=libtcd
pkgver=2.2.6.r2
pkgrel=1
pkgdesc="Provides a software API for reading and writing Tide Constituent Database (TCD) files"
arch=('i686' 'x86_64')
url="http://flaterco.com/xtide/libtcd.html"
license=('custom')
source=('ftp://ftp.flaterco.com/xtide/libtcd-2.2.6-r2.tar.bz2')
md5sums=('35bf5219fa66b16c9b932929f2ab457e')

build() {
  #cd "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname-2.2.6"

  ./configure --prefix=/usr
  make
}

package() {
  #cd "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname-2.2.6"

  make DESTDIR="$pkgdir/" install

  # install custom license
  install -d -m0755 $pkgdir/usr/share/licenses/$pkgname
  install -m0644 COPYING $pkgdir/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
