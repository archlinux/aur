# Maintainer: Mestik78 <mestik@gmail.com>
pkgname=bonsai-pomodoro
pkgver=0.2.0
pkgrel=1
pkgdesc="A beautiful Terminal User Interface (TUI) Pomodoro application written in Rust, inspired by Forest."
arch=('x86_64')
url="https://github.com/Mestik78/bonsai-pomodoro"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Mestik78/bonsai-pomodoro/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a2489ccbfc88df245a48bb2a39b83ab7eba278d6e3a0e63bdfdad70506ed00ab')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/bonsai_pomodoro" "$pkgdir/usr/bin/bonsai-pomodoro"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
