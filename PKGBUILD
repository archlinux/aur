# Maintainer: Phil Kulak <phil@kulak.us>
pkgname=matui
pkgver=0.4.5
pkgrel=1
pkgdesc="An opinionated Matrix TUI client."
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/pkulak/matui"
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pkulak/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('18a9cd6ae49cf09c73c786e23fbf9328bfc815bc196b1a30a8fef6d46f940d0433335d16c4fe371408d09c27bfe59f76016581eb7078d648005554e5c4201a11')

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

