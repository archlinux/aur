# Maintainer: execrooted <execrooted@gmail.com>

pkgname=discord-updater-tool
pkgver=0.1.0
pkgrel=1
pkgdesc="A tool to download and install the latest Discord version to resolve update issues."
arch=('x86_64')
url="https://github.com/execrooted/discord-updater"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/discord-updater-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/discord-updater-$pkgver"
    install -Dm755 "target/release/discord-updater" "$pkgdir/usr/bin/discord-updater-tool"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
