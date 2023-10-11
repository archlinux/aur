# Maintainer: Frederic Bezies <fredbezies at gmail dot com>

pkgname=lzsa
pkgver=1.4.1
pkgrel=1
pkgdesc='Byte-aligned, efficient lossless packer for fast decompression on 8-bit micros '
arch=('x86_64')
url='https://github.com/emmanuel-marty/lzsa'
license=('zlib')
makedepends=(clang)
source=(https://github.com/emmanuel-marty/lzsa/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('c65ca1e6a43696f4ca5edc2c98229fba1044806bd21bc2a8ce4b867dc9cfc45c')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 lzsa "$pkgdir/usr/bin/lzsa"
}
