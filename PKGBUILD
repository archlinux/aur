pkgname=wavedl
pkgver=1.1.0
pkgrel=1
pkgdesc="GTK4 internet video downloader"
arch=('x86_64')
url="https://github.com/htcdevk0/WaveDL"
license=('GPL3')

depends=('gtk4' 'cjson' 'yt-dlp' 'ffmpeg')
makedepends=('gcc' 'make')

source=("https://github.com/htcdevk0/WaveDL/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/WaveDL-$pkgver"
    make
}

package() {
    cd "$srcdir/WaveDL-$pkgver"

    install -Dm755 build/wavedl "$pkgdir/usr/bin/wavedl"

    install -Dm644 misc/wavedl.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/wavedl.svg"

    install -Dm644 misc/wavedl.desktop \
        "$pkgdir/usr/share/applications/wavedl.desktop"
}
