# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname=pinfo-patched-git
pkgver=0.6.13.r8.g3d76eec
pkgrel=1
pkgdesc="A hypertext info file viewer (patched bug-fix version)"

arch=('x86_64')
url="https://github.com/plp13/pinfo"
license=('GPL')
depends=('ncurses' 'readline')
conflicts=('pinfo' 'pinfo-git')
source=("$pkgname"::"git+https://github.com/plp13/pinfo.git")
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	[ -x configure ] || ./autogen.sh
	[ -f Makefile ] || ./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
}
