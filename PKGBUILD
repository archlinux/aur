# Maintainer: Faezix <faezix@github.com>
pkgname=yt-transcriber
pkgver=0.1.3
pkgrel=1
pkgdesc="CLI tool to extract YouTube video transcripts with timestamps"
arch=('x86_64' 'aarch64')
url="https://github.com/Faeziix/yt-transcriber"
license=('MIT')
depends=('yt-dlp')
makedepends=('rust' 'cargo')
options=('!debug')
install=$pkgname.install

source=("$pkgname-$pkgver.tar.gz::https://github.com/Faeziix/yt-transcriber/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
