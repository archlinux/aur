# Maintainer: Jonathan Birk <jona@jbirk.de>

pkgname=toggle_cool_cow_says_type
pkgver=0.1.8
pkgrel=1
pkgdesc="A terminal based typing game."
arch=('x86_64')
url='https://github.com/togglebyte/toggle_cool_cow_says_type'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/togglebyte/toggle_cool_cow_says_type/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('06ececa4130cab1364ef14f84168f889da899b6f886697ca402078b723ba76aa')            

build() {
    cd ${pkgname}-${pkgver}

    cargo build --release --locked --all-features
}

check() {
    cd ${pkgname}-${pkgver}
}

package() {
    cd ${pkgname}-${pkgver}

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "target/release/tccst" "$pkgdir/usr/bin/tccst"
}

