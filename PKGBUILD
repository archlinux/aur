# Contributor: Natanael Copa <ncopa@alpinelinux.org>
# Maintainer: Yauheni Kirylau <actionless.loveless+aur@gmail.com>
pkgname=libxxf86dga
pkgver=1.1.5
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
md5sums=('0ddeafc13b33086357cfa96fae41ee8e')
sha256sums=('2b98bc5f506c6140d4eddd3990842d30f5dae733b64f198a504f07461bdb7203')
sha512sums=('0e77c4003aeba737b10c17d55aeefa935fc57c4ba9e8f79a834f3f8c690d6a1d98f69ad707eded784346c1cf40c41829719d257283b5eae3207147fb4c79ed89')

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
