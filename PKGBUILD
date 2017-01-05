# Maintainer: Robert Holt <holt.r94 at gmail dot com>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: Yorhel <projects@yorhel.nl>
# Contributor: archtux <antonio.arias99999@gmail.com>

pkgname=ncdc
pkgver=1.20
pkgrel=1
pkgdesc="Modern and lightweight direct connect client with a friendly ncurses interface"
arch=('i686' 'x86_64' 'arm')
url="http://dev.yorhel.nl/ncdc"
license=('MIT')
depends=('bzip2' 'gnutls' 'ncurses' 'sqlite' 'glib2' 'geoip')
source=("http://dev.yorhel.nl/download/$pkgname-$pkgver.tar.gz")
md5sums=('662fbddf17392cdb963d480af1812ae7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-geoip
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
