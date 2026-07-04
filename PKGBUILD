# Maintainer: PBS <pbs3141 at gmail dot com>
pkgname=capypdf
pkgver=0.21.0
pkgrel=2
pkgdesc='Fully color-managed PDF generation library'
arch=('x86_64')
url="https://github.com/jpakkane/$pkgname"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'python' 'libpng' 'zlib' 'lcms2' 'libjpeg-turbo' 'freetype2' 'libtiff')
makedepends=('meson')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('b269a7361252b737f47b744f5329ba63f29af5bd3c46acbf7d4a4e074661f8a1')

build() {
    cd "$srcdir"
    arch-meson build "$pkgname-$pkgver"
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
