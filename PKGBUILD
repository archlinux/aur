# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>

pkgname=gimp-webp
pkgver=0.2
pkgrel=1
pkgdesc="This plugin provides Gimp with the ability to load and export WebP images."
arch=('i686' 'x86_64')
url="https://github.com/nathan-osman/gimp-webp"
license=('GPL3')
groups=(gimp-plugins)
depends=(gimp libwebp)
makedepends=(cmake)
conflicts=(gimp-plugin-webp)
source=(https://github.com/nathan-osman/$pkgname/archive/$pkgver.tar.gz)
sha1sums=('d0b0d6bbf9004a043ea10ac1fd84bd2783d190b6')

build() {
    mkdir -p "$srcdir/$pkgname-$pkgver/build"
    cd "$srcdir/$pkgname-$pkgver/build"
    cmake ..
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir" install
}
