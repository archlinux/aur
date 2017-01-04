# Maintainer: Ivan Kolesnikov <kiv.apple@gmail.com>
pkgname=x-on-resize
pkgver=0.2
pkgrel=1
epoch=
pkgdesc="A simple display configuration daemon"
arch=(i686 x86_64)
url="https://keithp.com/blogs/x-on-resize/"
license=('GPL2')
groups=()
depends=('xorg-xrandr')
makedepends=('git' 'xorg-util-macros')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+git://people.freedesktop.org/~keithp/x-on-resize")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd "$pkgname"
	./autogen.sh --prefix /usr
	make
}

package() {
	cd "$pkgname"
	make install DESTDIR="$pkgdir"
}
