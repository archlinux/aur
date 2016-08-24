# Maintainer: Jason Waataja <jasonswaataja@gmail.com>
pkgname=jws-git
pkgver=1.2.0.r0.c8ae8c7
pkgrel=1
pkgdesc="A wallpaper setter for minimalist window managers"
arch=(x86_64)
url="https://github.com/JasonWaataja/JWS"
license=('GPL')
groups=()
depends=('glib2' 'feh' 'gettext')
makedepends=('git')
provides=('jws-git')
conflicts=('jws-git')
replaces=()
backup=()
options=()
install=
source=('jws-git::git+https://github.com/JasonWaataja/JWS.git')
noextract=()
md5sums=('SKIP')
pkgver() {
   cd "${srcdir}/jws-git"
   printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}
build() {
	cd "$srcdir/jws-git"
	./autogen.sh
	./configure --prefix=/usr
	make
}
check() {
	cd "$srcdir/jws-git"
	make -k check
}
package() {
	cd "$srcdir/jws-git"
	make DESTDIR="$pkgdir/" install
}
