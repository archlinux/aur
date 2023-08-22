# Maintainer: Relwi <theofficialdork@hotmail.com>
pkgname=dinit
pkgver=0.17.0
pkgrel=1
pkgdesc='Service monitoring / "init" system'
url='https://github.com/davmac314/dinit'
source=("$pkgname-$pkgver.tar.gz::https://github.com/davmac314/dinit/archive/v$pkgver.tar.gz")
arch=(x86_64 arm aarch64)
license=(Apache)
makedepends=(make)
sha256sums=('4b2ac6e6ca45af7d944341fbde6560d68eeedbc6c15a3c7e1d1847b16ecace80')

build () {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" SBINDIR=/usr/bin SHUTDOWN_PREFIX="dinit-" install
}
