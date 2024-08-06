# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=ud
pkgver=1.1.0
pkgrel=1
pkgdesc='UNIX day utility'
arch=(x86_64)
url='https://github.com/xyproto/ud'
license=(BSD3)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7f8f38e574eb0cafd94cc2d13acb0d1d4dc6a6deab23bca938e9641cdb77f21f')

build() {
  cd $pkgname-$pkgver
  gcc -std=c18 -D_GNU_SOURCE $CFLAGS -o ud main.c
}

package() {
  install -Dm755 $pkgname-$pkgver/ud "$pkgdir/usr/bin/ud"
}
