# Maintainer: Relwi <theofficialdork@hotmail.com>
pkgname=dinit
pkgver=0.15.1
pkgrel=8
pkgdesc='Service monitoring / "init" system'
url='https://github.com/davmac314/dinit'
source=("$pkgname-$pkgver.tar.gz::https://github.com/davmac314/dinit/archive/v$pkgver.tar.gz")
arch=(x86_64 arm aarch64)
license=(Apache)
conflicts=(systemd-sysvcompat)
makedepends=(make)
sha256sums=('b6cc489079a6600ae5f89cbc52b6046bd522e8e91da60c6a3006c4224cba83b4')

build () {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" SBINDIR=/usr/bin install 
}
