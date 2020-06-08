# Maintainer: Phil Kulak <pkulak@gmail.com>
pkgname=pgen
pkgver=1.0.0
pkgrel=1
pkgdesc="An opinionated password generator."
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/pkulak/pgen"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pkulak/$pkgname/archive/$pkgver.tar.gz")
b2sums=('38ae19002feddce282e54ad7bfa665c740c7c8370fa4dbf8b30150c4e9c60523274c46d65b10dcf6ba1ec4c628c8c61d80814a1e7682589e5a31c0a6e1413212')

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
