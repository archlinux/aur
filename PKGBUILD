# Maintainer: jxir <aur@jxir.de>

pkgname=wtf8
pkgver=2.0.0
pkgrel=1
pkgdesc="Inspect UTF-8 strings inline with their component bytes"
arch=('x86_64')
url="https://dev.sanctum.geek.nz/cgit/wtf8.git"
license=('GPL-3.0-or-later')
depends=('glibc')
source=("$url/snapshot/$pkgname-$pkgver.tar.gz")
sha256sums=('bd1bcf29b566e8d5f446f4c38110c8d1126a2f2011ce7746a093c3496b5ba14d')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname -t "$pkgdir/usr/bin/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
