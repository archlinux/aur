# Maintainer: whoami <whoami@systemli.org>
# Contributor: Robert Holt <holt.r94 at gmail dot com>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: Yorhel <projects@yorhel.nl>
# Contributor: archtux <antonio.arias99999@gmail.com>

pkgname=ncdc
pkgver=1.22
pkgrel=1
pkgdesc='Modern and lightweight direct connect client with a friendly ncurses interface'
arch=('i686' 'x86_64' 'arm' 'armv6h')
url='http://dev.yorhel.nl/ncdc'
license=('MIT')
depends=('gnutls' 'sqlite' 'glib2' 'libmaxminddb')
source=("http://dev.yorhel.nl/download/$pkgname-$pkgver.tar.gz")

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

sha256sums=('fd41ef85cec3eca0107d83583ad25faa8804dd22d76f6da7fc157e0233b13a59')
