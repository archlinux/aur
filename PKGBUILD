# Maintainer: Ian D. Scott <ian@perebruin.com>
# Contributor: Daniel Isenmann <daniel.isenmann [at] gmx.de>
pkgname=gfa
pkgver=0.4.1
pkgrel=2
pkgdesc="gfa is small and fast address book written in C and GTK+2"
arch=('i686' 'x86_64')
url="http://gfa.sourceforge.net"
license="GPL"
depends=('sqlite3' 'gtk2')
source=(http://sourceforge.net/projects/gfa/files/$pkgname-$pkgver.tar.gz gfa.desktop)
md5sums=('12337963c40946ab5145f04f0a07a2d6' '19bdc40fe78043fbf31ee32b6a5f2c14')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/applications"
  install -D -m644 "../$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  make DESTDIR="$pkgdir" install
}
