pkgname=rconf
pkgver=2.0.0
pkgrel=1
arch=(x86_64)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jasonverbeek/rconf/archive/v$pkgver.tar.gz")
md5sums=('SKIP')

build() {
  cargo build \
    --manifest-path "$srcdir/$pkgname-$pkgver/Cargo.toml" \
    --release
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

