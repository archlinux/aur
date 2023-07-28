# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=ud
pkgver=1.0.1
pkgrel=1
pkgdesc='UNIX day utility'
arch=(x86_64)
url='https://github.com/xyproto/ud'
license=(BSD3)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0627220fb8c615c8bc70b90fdd443a6738f9eb5fba1d6c110e9d93a1b7843766')
b2sums=('485f81de5f9568bec1fa70d1db508bd6f5d5c18e1e12b3d0170b897ba2eb6b4d96ff0cf3b84416e083e469ca7724624934a9ac435727a0c01333d4fa632ce95a')

build() {
  cd $pkgname-$pkgver
  gcc -std=c18 -D_GNU_SOURCE $CFLAGS -o ud main.c
}

package() {
  install -Dm755 $pkgname-$pkgver/ud "$pkgdir/usr/bin/ud"
}
