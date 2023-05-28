# Maintainer: Phil Kulak <phil@kulak.us>
pkgname=matui
pkgver=0.4.1
pkgrel=1
pkgdesc="An opinionated Matrix TUI client."
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/pkulak/matui"
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pkulak/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('e37555b3b70e5ec47d9e560ef04f67c2334ef5bbaaed8aa8f6d59021866d684110d53690646f47d264bb82b215bd94cfc063fc38e936b60d98078a2d75fe33e8')

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

