# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=cimfomfa
pkgver=21.361
pkgrel=1
pkgdesc='C utility library for zoem programming language'
arch=(x86_64)
url='https://micans.org/cimfomfa/'
license=('GPL2')
source=("https://micans.org/$pkgname/src/$pkgname-${pkgver/./-}.tar.gz")
sha256sums=('621dd7a689b0ef03e1891bcb05cb8d5d53e3b9b0f0cbd32303d1140ec2c70a86')

build() {
  cd "$pkgname-${pkgver/./-}"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  make -C "$pkgname-${pkgver/./-}" install DESTDIR="$pkgdir"
}
