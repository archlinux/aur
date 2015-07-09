# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>

pkgname=gimp-plugin-webp
pkgver=0.2
pkgrel=1
pkgdesc="Gimp plugin to load and save files using the new WebP image format."
arch=('i686' 'x86_64')
url="https://github.com/nathan-osman/gimp-webp"
license=('GPL-3.0')
depends=(gimp libwebp)
makedepends=(cmake)
source=(https://github.com/nathan-osman/gimp-webp/archive/$pkgver.tar.gz)
sha1sums=('d0b0d6bbf9004a043ea10ac1fd84bd2783d190b6')

build() {
    mkdir -p "$srcdir/gimp-webp-$pkgver/build"
    cd "$srcdir/gimp-webp-$pkgver/build"
    cmake ..
    make
}

package() {
    cd "$srcdir/gimp-webp-$pkgver/build"
    make DESTDIR="$pkgdir" install
}
