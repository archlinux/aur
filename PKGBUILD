# Maintainer: Willy Micieli <micieli@vivaldi.net>

pkgname=zuu
pkgver=6.0.0
pkgrel=1
pkgdesc="A git hook test runner for rust programer" 
provides=("zuu")
arch=('any')
url="https://github.com/taishingi/zuu"
license=('GPL3')
makedepends=('cargo')
depends=('rustup' 'git-graph' 'git-igitt' 'rsbadges' 'wget' 'git')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('c3c993b8c2e8bc17091b0b07f26ac837bf842453a0af87fad144ceeb13e32952')

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release 
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
