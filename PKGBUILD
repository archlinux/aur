# Maintainer: Jan Fidra <tkmxqrd@gmail.com>
pkgname=davinci-convert
pkgver=1.0.0
pkgrel=1
pkgdesc="A video converter for Davinci Resolve using FFmpeg"
arch=('x86_64')
url="https://github.com/tkmxqrdxddd/davinci-video-converter"
license=('MIT')
depends=('ffmpeg')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tkmxqrdxddd/davinci-video-converter/archive/refs/tags/1.0.0.tar.gz")  # Updated source URL
sha256sums=('SKIP')  # Replace with the actual checksum after generating

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
    echo "compilation succesfull"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 output/davinci-convert "$pkgdir/usr/bin/davinci-convert"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"  # Include documentation if available
}
