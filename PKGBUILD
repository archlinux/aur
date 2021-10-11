# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=libmobi
pkgver=0.8
pkgrel=1
pkgdesc="Library for handling Kindle formats of ebook documents"
arch=('x86_64')
url="https://github.com/bfabiszewski/libmobi"
license=('LGPL3')
depends=('libxml2' 'zlib')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('8d766d39531b10a16a6e904fd91614e09c11fec147b4d133b053c807797b07328c8bdce83d8660edb31de25060f72f219c9d7a53936f37e1260d32cc198d5da7')
b2sums=('55b07287d596db555305819db6e78083aa0011e870e1a0e2be032da0266d4252e4c38be315b6375a17535fae700b5aace2fddb72b4decdf31fb1f47327156994')

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
