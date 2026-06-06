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
sha256sums=('6ef3075a8fb7780cee994197a2a89623bca48b815862d3f3d10300cb254fcdb4')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
