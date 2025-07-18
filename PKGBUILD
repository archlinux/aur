# Maintainer: Mobin Aydinfar <mobin@mobintestserver.ir>
pkgname=dinit
pkgver=0.19.4
pkgrel=1
pkgdesc='Service monitoring / "init" system'
url='https://github.com/davmac314/dinit'
source=("$pkgname-$pkgver.tar.gz::https://github.com/davmac314/dinit/archive/v$pkgver.tar.gz")
arch=(x86_64 arm aarch64)
license=(Apache)
makedepends=(make)
sha256sums=('3c0f624eb958f8e884631be4ef687da1e475ebaa6241e7ee330b864e6cd9e30b')

build() {
  cd "$pkgname-$pkgver"
  ./configure --sbindir="/usr/bin" --shutdown-prefix="dinit-"
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
  make check-igr
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
