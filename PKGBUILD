# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=sleeping-getty
pkgver=1.1
pkgrel=1
pkgdesc="Do not start a fullblown getty before it is necessary"
arch=(i686 x86_64)
url="https://github.com/maandree/sleeping-getty"
license=('custom:ISC')
depends=()
makedepends=(linux-api-headers)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(7d7303e8c7f6d543d33a1c2686f000362c42764821bf4346af7004124edb4136)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
  mv -- "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
}
