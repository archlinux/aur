# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=wurl
pkgver=0.0.2
pkgrel=1
pkgdesc='Utility for fetching URIs with libcurl and a drop-in replacement for wget (for the most common flags)'
arch=(x86_64)
url='https://github.com/xyproto/wurl'
license=(MIT)
provides=(wget)
conflicts=(wget)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('24567413dbd32d6515aace3ddbd6d8a7410b5f27900d76a277d1607ec82e9b555e100e5e3b5f079bb268d133d1516eb9c64d7ce5decc0c67bf5990aded31fde1')

build() {
  make -C $pkgname-$pkgver
}

package() {
  cd $pkgname-$pkgver
  make install PREFIX="$pkgdir/usr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
