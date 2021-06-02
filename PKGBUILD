# Maintainer: Simone Cimarelli <aquilairreale@ymail.com>

pkgname=donut
pkgver=0.9.3
pkgrel=1
pkgdesc='x86, x64, or AMD64+x86 position-independent shellcode generator'
arch=('x86_64')
url='https://github.com/TheWover/donut'
license=('BSD')
source=("https://github.com/TheWover/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('523d83ce2a605bec0d4b3c7aa910bea41839fc7b4c923a737993ecf6a2d112080c7e3a3f38e2e9bc3cf06919be073df21f288af22a87c28b042da3d37ac624b2')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 "lib/lib$pkgname.a" "$pkgdir/usr/lib/lib$pkgname.a"
  install -Dm755 "lib/lib$pkgname.so" "$pkgdir/usr/lib/lib$pkgname.so"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
