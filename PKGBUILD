# Contributor: Natanael Copa <ncopa@alpinelinux.org>
# Maintainer: Yauheni Kirylau <actionless.loveless+aur@gmail.com>
pkgname=libxxf86dga
pkgver=1.1.7
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
md5sums=('543164f1239fbe92cc0a9128d8da88e9')
sha256sums=('b3be5b444d324cb6e0f4b5019a4972c99ea336ccb8ab7968eccefecd917ffde6')
sha512sums=('3476fe374fb61e9c45ad10ca15a65266eee4358843dfa3c4869ce08aae614a362ba375c210025c6bb3df8de32464e7156026aae9cded750b6ebd222a2f2a04eb')

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
