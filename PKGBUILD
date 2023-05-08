# Maintainer: Phil Kulak <phil@kulak.us>
pkgname=matui
pkgver=0.3.0
pkgrel=1
pkgdesc="An opinionated Matrix TUI client."
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/pkulak/matui"
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pkulak/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('a4c83135079a2483fb9329b205ba0ecf46abebfdb29eb766bb1cd9d2c13bf1a8dfcdcce571b8b4e847ee99f2226e51407ecadec87205f1887a5f62fce3e93c01')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked --all-features
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}

