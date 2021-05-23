# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=myip-rs
pkgver=0.2.0
pkgrel=1
pkgdesc='A command-line tool to show your external IP address'
arch=('x86_64')
url='https://github.com/crabvk/myip'
license=('MIT')
makedepends=('cargo')
optdepends=('geoipupdate: download/update local GeoIP2 database from MaxMind')
source=("https://github.com/crabvk/myip/archive/$pkgver.tar.gz")
sha512sums=('ba1f62e5accf2d34f27c0404797255c1131e81e7f64fb8a7a7d12e4d1134a6b117e84cd59edf86f4b95252ea8e4b69aad4c3957b02981dc5e081e1c81a7f6bb6')

build() {
    cd myip-$pkgver
    cargo build --release --locked --target-dir=target
}

package() {
    cd myip-$pkgver
    install -Dm755 target/release/myip -t "$pkgdir"/usr/bin
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
