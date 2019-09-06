# Maintainer: Kevin Song <kevin dot s05 at gmail dot com>

pkgname='starship'
pkgdesc='The cross-shell prompt for astronauts'
pkgver='0.15.0'
pkgrel='2'
arch=('x86_64')
url='https://starship.rs/'
license=('ISC')
depends=('openssl' 'zlib')
makedepends=('rust' 'gcc')
checkdepends=('rust' 'git')
provides=(starship)
#install="$pkgname.install"
source=("https://github.com/starship/starship/archive/v${pkgver}.tar.gz")
sha256sums=('87a23db05a5ac4810b8f6143d6e8b134a4831cd085b4072eba2ead014bd0b221')
PKGEXT='.pkg.tar.gz'

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

#check() {
#    cd "$pkgname-$pkgver"
#    cargo test --locked
#}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/starship" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
