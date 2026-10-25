# Maintainer: PBS <pbs3141 at gmail dot com>
pkgname=capypdf
pkgver=0.22.0
pkgrel=1
pkgdesc='Fully color-managed PDF generation library'
arch=('x86_64')
url="https://github.com/jpakkane/$pkgname"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'python' 'libpng' 'zlib' 'lcms2' 'libjpeg-turbo' 'freetype2' 'libtiff')
makedepends=('meson')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('3e6b8ebd639efca3a73afb49ce47e1a3b6fb1591f5e0965bd6ab001bd2f22817')

build() {
    cd "$srcdir"
    arch-meson build "$pkgname-$pkgver"
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
