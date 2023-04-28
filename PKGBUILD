# Maintainer: Phil Kulak <phil@kulak.us>
pkgname=matui
pkgver=0.2
pkgrel=1
pkgdesc="An opinionated Matrix TUI client."
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/pkulak/matui"
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pkulak/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('e8d27941430b8175d01fd0477f96cdc11dd6caa53eab6b39c101ef97cb3f90a7b818987e6e16fb7cd81276f204ad9f9c41d73f4f747fee8389d0627c643c2bb7')

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

