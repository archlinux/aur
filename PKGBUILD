# Maintainer: PBS <pbs3141 at gmail dot com>
pkgname=capypdf
pkgver=0.17.0
pkgrel=1
pkgdesc='Fully color-managed PDF generation library'
arch=('x86_64')
url="https://github.com/jpakkane/$pkgname"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'python' 'libpng' 'zlib' 'lcms2' 'libjpeg' 'freetype2' 'libtiff')
makedepends=('meson')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('60ac70a2345eb7dd0ac8aaf4af0a0c59ca1035936cb381cb633ae265da3b5e77')

build() {
    cd "$srcdir"
    arch-meson build "$pkgname-$pkgver"
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
