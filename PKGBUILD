# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=ud
pkgver=1.0.0
pkgrel=1
pkgdesc='UNIX day utility'
arch=(x86_64)
url='https://github.com/xyproto/ud'
license=(BSD3)
source=("$url/releases/download/v1.0.0/ud-1.0.0.tar.gz")
b2sums=('6dc77c593ce84634280f47fac207f2db0b34bbc6912523f746bb4ffbc04713c2f6b3780be1452038b5f682a8876cacbf3a67849fbf824ed0cb9cbda76d6d4703')

build() {
  cd $pkgname-$pkgver
  gcc -std=c18 -D_GNU_SOURCE $CFLAGS -o ud main.c
}

package() {
  install -Dm755 $pkgname-$pkgver/ud "$pkgdir/usr/bin/ud"
}
