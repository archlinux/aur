# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Dan T. <dnt@tuta.io>
# Credit to 6.0.5 maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=grfcodec
pkgver=6.2.0
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
b2sums=('bd4f48714eb28fc68d8675b4236695855e0234c3a3eadae7c76385f524286aa71c69ec327ea2953abcb1fcf93b45d97473616668fb7f75630bc1ea9fcb6c856d')

build() {
	cmake "-S$pkgname-$pkgver" -B_build -GNinja -DCMAKE_INSTALL_PREFIX=/usr
	ninja -C_build
}

package() {
	DESTDIR="$pkgdir" ninja -C_build install
}
