# Maintainer: Amr Hassan <amr.hassan@gmail.com.com>
pkgname=dataframe
pkgver=0.1.0
pkgrel=2
pkgdesc="CLI for introspecting data frames (Avro, Parquet)"
arch=(x86_64)
url="https://github.com/amrhassan/dataframe"
license=('MIT')
source=("https://github.com/amrhassan/$pkgname/archive/$pkgver.tar.gz")
noextract=()
md5sums=('7a88943e917d743c8742f1280eda04b6')
makedepends=(rustup)

prepare() {
   rustup default stable
}

build() {
   cd "$pkgname-$pkgver"
   cargo build --release --locked
}

check() {
   cd "$pkgname-$pkgver"
   cargo test --release --locked
}

package() {
   cd "$pkgname-$pkgver"
   install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
