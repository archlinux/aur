# Maintainer: Amr Hassan <amr.hassan@gmail.com.com>
pkgname=dataset
pkgver=0.2.2
pkgrel=2
pkgdesc="Dataset introspection CLI"
arch=(x86_64)
url="https://github.com/amrhassan/dataset"
license=('MIT')
source=("https://github.com/amrhassan/$pkgname/archive/$pkgver.tar.gz")
noextract=()
md5sums=('42e929fb4afdb581a5e92f343218d9fa')
makedepends=(cargo)

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
