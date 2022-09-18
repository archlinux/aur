# Maintainer: Max von Forell <aur at vonforell dot de>

pkgname=toluol
pkgver=2.0.0
pkgrel=1
pkgdesc='Rust tool to make DNS queries'
arch=(x86_64)
url="https://git.sr.ht/~mvforell/$pkgname"
license=('MIT')
makedepends=('cargo')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('63b5aed418d208ad44cad360252dec8f4ddd2e98023815782a71a62ebf047b2a388a5c123607ed2fecf8215ac0153cbd28f5d4319f2937d488f2e7e2163a868e')

build() {
  cd $pkgname-$pkgver
  cargo build --release --target-dir 'target/'
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

