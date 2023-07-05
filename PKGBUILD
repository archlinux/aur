# Maintainer: Phil Kulak <phil@kulak.us>
pkgname=matui
pkgver=0.4.4
pkgrel=1
pkgdesc="An opinionated Matrix TUI client."
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/pkulak/matui"
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pkulak/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('023f58b5ed02f0288b40251a211ecd89920a0112bc02afd56612220d4af67fb125bc889303682b0b4e3706165d1769a52385378bfa957d3e5bc063bfc88620c3')

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

