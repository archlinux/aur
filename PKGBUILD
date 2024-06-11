# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Dan T. <dnt@tuta.io>
# Credit to 6.0.5 maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=grfcodec
pkgver=6.1.0
pkgrel=1
pkgdesc='A tool to convert a GRF file into graphics files and meta data, and vice versa'
arch=(i686 x86_64)
url=https://github.com/OpenTTD/grfcodec
license=(GPL-2.0-only)
depends=(gcc-libs glibc libpng)
makedepends=(boost cmake ninja)
provides=(nforenum)
conflicts=(nforenum)
replaces=(nforenum)
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/$pkgver/$pkgname-$pkgver-source.tar.xz")
b2sums=('e9ce6ca4984e319abd5c1fd53473b1257b2b98b0948b5bef5e6275e29b50243981bf7fc837b190b37b2bb12d2ac9aecbb8595150eedb029f1d7ae64053668475')

build() {
	cmake "-S$pkgname-$pkgver" -B_build -GNinja -DCMAKE_INSTALL_PREFIX=/usr
	ninja -C_build
}

package() {
	DESTDIR="$pkgdir" ninja -C_build install
}
