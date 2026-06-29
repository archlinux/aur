# Maintainer: DBeidachazi
pkgname=liblhdcv5
pkgver=0.1.0
pkgrel=1
pkgdesc="AOSP LHDC v5 Bluetooth encoder library for Linux"
arch=('x86_64')
url="https://github.com/DBeidachazi/liblhdcv5"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'gcc' 'make' 'git')
options=('!strip')
source=("git+https://github.com/DBeidachazi/liblhdcv5.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make VERSION="$pkgver"
}

package() {
  cd "$srcdir/$pkgname"
  make VERSION="$pkgver" DESTDIR="$pkgdir" install
  install -Dm644 LICENSE-APACHE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}
