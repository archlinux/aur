# Maintainer: Phil Kulak <phil@kulak.us>
pkgname=matui
pkgver=0.1.1
pkgrel=1
pkgdesc="An opinionated Matrix TUI client."
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/pkulak/matui"
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pkulak/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('08134401f7ca343ba4c901aedf93fa49db6c9d2d711d33633ef3fb6f3195ea3bb9de773f0331989de884cc5445eaa56047ae6c8efd3f4e436d42cb57bbcfd794')

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

