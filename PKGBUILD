# Maintainer: Jan Fidra <tkmxqrd@gmail.com>
# Contributor: Jan Fidra <tkmxqrd@gmail.com>
pkgname=davinci-convert
pkgver=2.0.0
_gitpkgname=davinci-video-converter
pkgrel=1
pkgdesc="A video converter for Davinci Resolve using FFmpeg"
arch=('x86_64')
url="https://github.com/tkmxqrdxddd/davinci-video-converter"
license=('MIT')
depends=('ffmpeg')
makedepends=('gcc' 'cmake' 'make')
source=("$_gitpkgname-$pkgver.tar.gz::https://github.com/tkmxqrdxddd/davinci-video-converter/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$_gitpkgname-$pkgver"
    cmake -DCMAKE_BUILD_TYPE=Release -B build
    cmake --build build
    echo "compilation successful"
}

package() {
    cd "$srcdir/$_gitpkgname-$pkgver"
    install -Dm755 build/davinci-video-converter "$pkgdir/usr/bin/davinci-video-converter"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
