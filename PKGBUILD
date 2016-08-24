# Maintainer: Jason Waataja <jasonswaataja@gmail.com>
pkgname=jws-config-git
pkgver=1.2.0.r0.0d746e5
pkgrel=1
pkgdesc="A graphical configuration tool for JWS"
arch=(x86_64)
url="https://github.com/JasonWaataja/JWS-Config"
license=('GPL')
groups=()
depends=('gtk3' 'feh')
makedepends=('git')
provides=('jws-config-git')
conflicts=('jws-config-git')
replaces=()
backup=()
options=()
install=
source=('jws-config-git::git+https://github.com/JasonWaataja/JWS-Config.git')
noextract=()
md5sums=('SKIP')

pkgver() {
   cd "${srcdir}/jws-config-git"
   printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/jws-config-git"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/jws-config-git"
	make -k check
}

package() {
	cd "$srcdir/jws-config-git"
	make DESTDIR="$pkgdir/" install
}
