# Maintainer: PBS <pbs3141 at gmail dot com>
pkgname=capypdf
pkgver=0.16.0
pkgrel=1
pkgdesc='Fully color-managed PDF generation library'
arch=('x86_64')
url="https://github.com/jpakkane/$pkgname"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'python' 'libpng' 'zlib' 'lcms2' 'libjpeg' 'freetype2' 'libtiff')
makedepends=('meson')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('c9da376a2755b8bee5056d9144296c780bc79ca44bf8d79a8cef3114736e7120')

build() {
    cd "$srcdir"
    arch-meson build "$pkgname-$pkgver"
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
