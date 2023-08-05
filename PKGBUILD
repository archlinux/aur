# Maintainer: Simone Cimarelli <aquilairreale@ymail.com>

pkgname=donut
pkgver=1.0
pkgrel=1
pkgdesc='x86, x64, or AMD64+x86 position-independent shellcode generator'
arch=('x86_64')
url='https://github.com/TheWover/donut'
license=('BSD')
source=("https://github.com/TheWover/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('417278fedcff947462cec3988877b62116cdc98589f4b955827d47039288dcf84ce1fa8e1d18187b99ceeabc0f10924500c77d3728311166599b49d8f6eb151f')

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
