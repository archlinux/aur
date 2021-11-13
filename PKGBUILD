# Maintainer: henning mueller <mail@nning.io>

pkgname=protonutils
pkgver=1.2.0
pkgrel=1
pkgdesc="CLI tool that provides different utilities to make using the Proton compatibility tool more easily"
arch=("x86_64")
url="https://github.com/nning/protonutils"
license=("MIT")
makedepends=(go make)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c15889e43badf320bc4f7d0f835ec6a0da7c577ead27b9b6d1448ac7e879914f')

build() {
  cd $pkgname-$pkgver
  echo "#!/bin/sh\necho $pkgver" > build/version.sh
  make clean build
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 -t $pkgdir/usr/bin/ cmd/$pkgname/$pkgname
}
