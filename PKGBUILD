# Maintainer: PBS <pbs3141 at gmail dot com>
pkgname=capypdf
pkgver=0.19.0
pkgrel=1
pkgdesc='Fully color-managed PDF generation library'
arch=('x86_64')
url="https://github.com/jpakkane/$pkgname"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'python' 'libpng' 'zlib' 'lcms2' 'libjpeg' 'freetype2' 'libtiff')
makedepends=('meson')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('620c8e0a44a97880ac49a89530435aac3839e82676e9c263866154449ee7c203')

build() {
    cd "$srcdir"
    arch-meson build "$pkgname-$pkgver"
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
