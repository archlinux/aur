# Maintainer: Andreas Bosch (progandy) <linux+aur@progandy.de>

pkgname=fonttosfnt
pkgver=1.0.5
pkgrel=2
pkgdesc="Convert a set of bdf or pcf fonts in a bitmap only sfnt (otb)."
arch=(x86_64)
url="https://gitlab.freedesktop.org/xorg/app/fonttosfnt"
license=('MIT')
depends=(libfontenc freetype2)
makedepends=(make autoconf automake xorgproto)
source=("https://xorg.freedesktop.org/archive/individual/app/fonttosfnt-1.0.5.tar.gz")
sha512sums=(99d4c7f76eea46f4fbe2753bf0eb25140b6d41f1bb5345abf627f532721a3a22ed49c10ed52550e602abfe1d2015eed90fce59134f332cdeff4ca4c048db4f12)

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
