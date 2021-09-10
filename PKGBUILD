# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=libmobi
pkgver=0.7
pkgrel=1
pkgdesc="Library for handling Kindle formats of ebook documents"
arch=('x86_64')
url="https://github.com/bfabiszewski/libmobi"
license=('LGPL3')
depends=('libxml2' 'zlib')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('8fff0413b5be51ed0b330591f07034530e6a690951f263f8494fd8b1102f17702e77036a3fbfbab5ccf719ad787e510ef1e3b21a029b1b8666b02897639d157e')

build() {
  cd "$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --disable-static
  make
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
