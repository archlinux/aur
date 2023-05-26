# Contributor: Natanael Copa <ncopa@alpinelinux.org>
# Maintainer: Yauheni Kirylau <actionless.loveless+aur@gmail.com>
pkgname=libxxf86dga
pkgver=1.1.6
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
	"libXxf86dga-${pkgver}.tar.bz2::http://www.x.org/releases/individual/lib/libXxf86dga-$pkgver.tar.xz"
)
md5sums=('74d1acf93b83abeb0954824da0ec400b')
sha256sums=('be44427579808fe3a217d59f51cae756a26913eb6e4c8738ccab65ff56d7980f')
sha512sums=('61f7954471df63840ffb5e82347018e285d30d64d4d0a97770ca031c8554a0f52d1b007ab8342a283cd2f0d534f564fb59f57ec92515714f20a7d145912c65d9')

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
