# Maintainer: Luke Arms <luke@arms.to>

pkgname=timer-for-harvest
pkgver=0.3.8
pkgrel=1
pkgdesc="Harvest client implemented using GTK+ and Rust"
url="https://github.com/frenkel/timer-for-harvest"
arch=(x86_64)
license=(BSD-2)
depends=(gtk3)
makedepends=(cargo git rust)
_commit=65e1dac5cb996d551a405fd4ffa6318a253e85db # tag/v0.3.8
source=(
    "git+https://github.com/frenkel/timer-for-harvest.git#commit=${_commit}"
)
sha256sums=(
    SKIP
)

prepare() {
    return 0
}

build() {
    return 0
}

package() {
    cd "$pkgname"
    cargo install --no-track --locked --root "$pkgdir/usr" --path .
    install -Dm 00755 -t "$pkgdir/usr/bin" target/release/timer-for-harvest
    install -Dm 00644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
    install -Dm 00644 -t "$pkgdir/usr/share/applications" assets/timer-for-harvest.desktop
}
