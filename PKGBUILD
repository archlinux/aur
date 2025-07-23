# Maintainer: iShawyha <shawyhaf@gmail.com>
pkgname=m3uget
pkgver=1.0.2
pkgrel=1
pkgdesc="Multi-threaded M3U8 stream downloader"
arch=('x86_64' 'aarch64')
url="https://github.com/OlexiyOdarchuk/m3uget"
license=('MIT')
depends=('yt-dlp' 'ffmpeg')
makedepends=('rust' 'cargo')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/OlexiyOdarchuk/m3uget/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1c62b94796209ed60ab1133a3e81507add3fea8ea05dfc81adf7d5a3aa87b180')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/m3uget" "$pkgdir/usr/bin/m3uget"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
