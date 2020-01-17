# Contributor: Natanael Copa <ncopa@alpinelinux.org>
# Maintainer: Yauheni Kirylau <actionless.loveless+aur@gmail.com>
pkgname=libxxf86dga
pkgver=1.1.4
pkgrel=1
pkgdesc="X11 Direct Graphics Access extension library"
url="http://xorg.freedesktop.org/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=("custom")
depends=()
makedepends=(
	xorgproto libxext libx11 xorg-util-macros
)
source=(
	"libXxf86dga-${pkgver}.tar.bz2::http://www.x.org/releases/individual/lib/libXxf86dga-$pkgver.tar.bz2"
)
md5sums=('d7dd9b9df336b7dd4028b6b56542ff2c')
sha256sums=('8eecd4b6c1df9a3704c04733c2f4fa93ef469b55028af5510b25818e2456c77e')
sha512sums=('58d81a7850275fc8382018bcc56dbc65b4200828b1f1379dcee3da1878f12a83ee681a9d474bcd564d99bf93bedfeb7b243370e0ebb89177652b37cee158a3f2')

build() {
	builddir="$srcdir"/libXxf86dga-$pkgver
	cd "$builddir"
	./configure \
		--build=$CBUILD \
		--host=$CHOST \
		--prefix=/usr
	make
}

package() {
	builddir="$srcdir"/libXxf86dga-$pkgver
	cd "$builddir"
	make DESTDIR="$pkgdir" install
}
