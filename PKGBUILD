# Maintainer: Relwi <theofficialdork@hotmail.com>
pkgname=dinit
pkgver=0.18.0
pkgrel=1
pkgdesc='Service monitoring / "init" system'
url='https://github.com/davmac314/dinit'
source=("$pkgname-$pkgver.tar.gz::https://github.com/davmac314/dinit/archive/v$pkgver.tar.gz")
arch=(x86_64 arm aarch64)
license=(Apache)
makedepends=(make)
sha256sums=('ec854903e93416b3f65e72009dcde4965869d8793e2314565484d94ede534e48')

build () {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" SBINDIR=/usr/bin SHUTDOWN_PREFIX="dinit-" install
}
