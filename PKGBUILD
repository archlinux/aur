# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=myip-rs
pkgver=0.2.1
pkgrel=1
pkgdesc='A command-line tool to show your external IP address'
arch=('x86_64')
url='https://github.com/crabvk/myip'
license=('MIT')
makedepends=('cargo')
optdepends=('geoipupdate: download/update local GeoIP2 database from MaxMind')
source=("https://github.com/crabvk/myip/archive/$pkgver.tar.gz")
sha512sums=('5789811dcc6cff8db2b4ae625a0eae59a9c40511e12972d80e61c792c74787d5c136a855f514b9f359d41c9397a609901fb7465b841219feaa1c21e01db75b93')

build() {
    cd myip-$pkgver
    cargo build --release --locked --target-dir=target
}

package() {
    cd myip-$pkgver
    install -Dm755 target/release/myip -t "$pkgdir"/usr/bin
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
