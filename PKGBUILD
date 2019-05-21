# Maintainer: Amr Hassan <amr.hassan@gmail.com.com>
pkgname=dataframe
pkgver=0.2.0
pkgrel=1
pkgdesc="CLI for introspecting data frames (Avro, Parquet)"
arch=(x86_64)
url="https://github.com/amrhassan/dataframe"
license=('MIT')
source=("https://github.com/amrhassan/$pkgname/archive/$pkgver.tar.gz")
noextract=()
md5sums=('76b7faee4335df648f183b1f066c2835')
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
