# Maintainer: Nicola Revelant <nicolarevelant44@gmail.com>

pkgname=pinfo-git
pkgver=0.6.13.r8.g3d76eec
pkgrel=1
pkgdesc="A hypertext info file viewer"

arch=('x86_64')
url="https://github.com/baszoetekouw/pinfo"
license=('GPL')
depends=('ncurses' 'readline')
conflicts=('pinfo')
source=("$pkgname"::"git+https://github.com/baszoetekouw/pinfo.git")
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
