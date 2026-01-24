# Maintainer: syntax-community <email@contoh.com>
pkgname=syntax-downloader
pkgver=1.0.0
pkgrel=1
pkgdesc="Universal video/audio social media downloader with CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/Syntax-Community/syntax-downloader.git"
license=('MIT')
depends=('yt-dlp' 'ffmpeg' 'go')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Syntax-Community/syntax-downloader/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('45c487b9eabb072eeac0569c7d5aa9434b6e497d9bbc96e9920b470e9bb4f118')

build() {
    cd "$srcdir/syntax-downloader-${pkgver}"
    go build -o get
}

package() {
    cd "$srcdir/syntax-downloader-${pkgver}"
    install -Dm755 get "$pkgdir/usr/bin/get"
}
