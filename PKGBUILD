# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=libmobi
pkgver=0.9
pkgrel=1
pkgdesc="Library for handling Kindle formats of ebook documents"
arch=('x86_64')
url="https://github.com/bfabiszewski/libmobi"
license=('LGPL3')
depends=('libxml2' 'zlib')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('369d135049853995162fe2918e396fa80a6040112cbc0abed5c582e55122acbeb4b3243079f2dee1fc094f25dca86b672d6a9770ce7638d08b33b94050006a5c')
b2sums=('de6e7e21cc524c7c1bc206e702db405de78a7a92f713b6a79731a14be741919bda90962acc617c3e0649910e889c1d6c270e997fe076157401e07917996ce7b1')

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
