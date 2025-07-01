# Maintainer: melqtx <melqtx@proton.me>
pkgname=yt-snip
pkgver=1.1.0
pkgrel=1
pkgdesc="Fast YouTube video/audio downloader and trimmer - a yt-dlp wrapper"
arch=('x86_64' 'i686')
url="https://github.com/melqtx/yt-snip"
license=('MIT')
depends=('yt-dlp' 'ffmpeg')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/melqtx/yt-snip/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')  # Replace with actual checksum later

build() {
    cd "$pkgname-$pkgver"
    g++ -std=c++17 -Wall -Wextra -O2 -o yt-snip main.cc
}

package() {
    cd "$pkgname-$pkgver"
    install -D -m 755 yt-snip "$pkgdir/usr/bin/yt-snip"
    install -D -m 644 README.md "$pkgdir/usr/share/doc/yt-snip/README.md"
    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/yt-snip/LICENSE"
}
