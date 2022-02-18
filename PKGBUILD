# Maintainer: Max von Forell <aur at vonforell dot de>

pkgname=toluol
pkgver=1.2.3
pkgrel=1
pkgdesc='Rust tool to make DNS queries'
arch=(x86_64)
url="https://git.sr.ht/~mvforell/$pkgname"
license=('MIT')
makedepends=('cargo')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('57ce77eaecd4a44b73128eb755fb862c1e6f13bbe656044808d527878151cd0d74143b26d2e256c12f5682d1ca9b53db149b0352af75fe419512b906a95c08e3')

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

