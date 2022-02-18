# Maintainer: Max von Forell <aur at vonforell dot de>

pkgname=toluol
pkgver=1.3.0
pkgrel=1
pkgdesc='Rust tool to make DNS queries'
arch=(x86_64)
url="https://git.sr.ht/~mvforell/$pkgname"
license=('MIT')
makedepends=('cargo')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('f08a8eb473b45e6ffa8749b3da2b2bc64fa3d4df4d8652036060dae1accb8d942f5af65028f697327a2af5cd8b8489d465bb046d70aa84bc2a68ae321703bfbc')

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

