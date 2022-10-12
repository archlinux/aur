# Maintainer: Relwi <theofficialdork@hotmail.com>
pkgname=dinit
pkgver=0.16.0
pkgrel=1
pkgdesc='Service monitoring / "init" system'
url='https://github.com/davmac314/dinit'
source=("$pkgname-$pkgver.tar.gz::https://github.com/davmac314/dinit/archive/v$pkgver.tar.gz")
arch=(x86_64 arm aarch64)
license=(Apache)
makedepends=(make)
sha256sums=('629666cebbcb1753216109d7583bd4621a375bf7940ccdaeda5443f713596e78')

build () {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" SBINDIR=/usr/bin SHUTDOWN_PREFIX="dinit-" install
}
