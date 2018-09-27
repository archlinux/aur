# Maintainer: Mitchell Renouf <mitchellarenouf@gmail.com>

pkgname=libopenaptx-git
_pkgname=libopenaptx
pkgver=r0.0.0eb6ce6
pkgrel=1
pkgdesc="Open Source implementation of Audio Processing Technology codec (aptX)"
arch=('x86_64')
url="https://github.com/pali/libopenaptx"
license=('LGPL 2.1')
depends=()
makedepends=('git')
provides=('libopenaptx')
conflicts=()
replaces=()
backup=()
options=()
install=
source=('git://github.com/pali/libopenaptx.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/libopenaptx"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/libopenaptx"
	make
}

package() {
	cd "$srcdir/libopenaptx"
	make DESTDIR="$pkgdir/" install
}
