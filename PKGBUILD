# Maintainer: Victor 'Sekain' Sepulveda <antonio.rms30@gmail.com>
pkgname=tacticaltray-linux
pkgver=1.0.0
pkgrel=1
pkgdesc="A Linux system tray monitor featuring Nox, the agent from Nightfall Tactics"
arch=('x86_64')
url="https://github.com/Sekain555/tacticaltray-linux"
license=('MIT')
depends=('libayatana-appindicator' 'xdotool')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Sekain555/tacticaltray-linux/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2cbdd3287ab05c75a366725c3faf05a3e2f8a1f37a40a2850bc0461bd7fae905')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
