# Maintainer: Mestik78 <mestik@example.com>
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
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/bonsai_pomodoro" "$pkgdir/usr/bin/bonsai-pomodoro"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
