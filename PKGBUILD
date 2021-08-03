# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=libmobi
pkgver=0.6
pkgrel=1
pkgdesc="Library for handling Kindle formats of ebook documents"
arch=('x86_64')
url="https://github.com/bfabiszewski/libmobi"
license=('LGPL3')
depends=('libxml2' 'zlib')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('7c25d5bb4414e5f90b57be1b7b0668c5fc535f670904862779331896933c699469049fcc3a0ccc0ae6c6cbe8819b87f461cbaf65adb20704b6e3a1f6114f7c55')

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
