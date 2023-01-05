pkgname=rustlings
pkgver=5.3.0
pkgrel=1
pkgdesc="Small exercises to get you used to reading and writing Rust code!"
arch=(x86_64)
url="https://github.com/rust-lang/rustlings/"
license=("MIT")
depends=(gcc-libs)
makedepends=(cargo python git)
provides=(rustlings)
conflicts=(rustlings)
install="rustlings.install"
source=("rustlings-${pkgver}::git+https://github.com/rust-lang/rustlings.git#tag=${pkgver}")
md5sums=('SKIP')


build() {
    cd $pkgname-$pkgver
    cargo build --release
}


package() {
    cd $pkgname-$pkgver
    install -D target/release/rustlings -t "$pkgdir"/usr/bin
    install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
    install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
