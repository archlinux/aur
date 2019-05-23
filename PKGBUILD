# Maintainer: Amr Hassan <amr.hassan@gmail.com.com>
pkgname=dataset
pkgver=0.2.1
pkgrel=1
pkgdesc="CLI for introspecting datasets"
arch=(x86_64)
url="https://github.com/amrhassan/dataframe"
license=('MIT')
source=("https://github.com/amrhassan/$pkgname/archive/$pkgver.tar.gz")
noextract=()
md5sums=('d5c5192cc7dc5a5b0e2874d55d0b192d')
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
