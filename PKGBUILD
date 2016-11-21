# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: György Balló <ballogy@freestart.hu>
pkgname=gdata-sharp
_pkgname=libgoogle-data-mono
pkgver=1.7.0.1
pkgrel=3
pkgdesc="Provide a simple protocol for reading and writing data on the web."
arch=('any')
url="http://code.google.com/p/google-gdata/"
license=('Apache')
depends=('mono')
source=(https://launchpad.net/ubuntu/+archive/primary/+files/$pkgname\_$pkgver.orig.tar.gz)
sha1sums=('69a643151baacfd6366e62c5cc7542b4c914cd46')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i '/PREFIX=/ s|/usr/local|/usr|' ./Makefile
  sed -i 's/gmcs/mcs/g' ./Makefile
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
