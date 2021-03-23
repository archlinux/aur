# Maintainer: Jonathan Birk <jona@jbirk.de>

pkgname=toggle_cool_cow_says_type
pkgver=0.1.7
pkgrel=1
pkgdesc="A terminal based typing game."
arch=('x86_64')
url='https://github.com/togglebyte/toggle_cool_cow_says_type'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/togglebyte/toggle_cool_cow_says_type/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('60f7aa208fe195a51ef312e114e0fe9a152a96beae2860b2750493b3d969ef46')            

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

