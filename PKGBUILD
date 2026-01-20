pkgname=syntax-downloader
pkgver=1.0.0
pkgrel=1
pkgdesc="Universal video/audio social media downloader with CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/Syntax-Community/syntax-downloader.git"
license=('MIT')
depends=('yt-dlp' 'ffmpeg' 'go')
source=("https://github.com/Syntax-Community/syntax-downloader/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('02a6b1ca5dd922c43b7e2c7e3f8cd141b748994edf396509eba3cb922ac6e568')

build() {
    cd "$srcdir/syntax-downloader-${pkgver}"
    go build -o get
}

package() {
    cd "$srcdir/syntax-downloader-${pkgver}"
    install -Dm755 get "$pkgdir/usr/bin/get"
}
