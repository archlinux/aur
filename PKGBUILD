# Maintainer: Brandon Hartshorn <brandon@thehartshorns.net>
pkgname=aewan
pkgver=1.0.01
pkgrel=3
epoch=
pkgdesc="A multi-layered ascii-art/animation editor"
arch=("x86_64")
url="http://aewan.sourceforge.net/"
license=('GPL2')
groups=()
depends=("zlib" "ncurses")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://downloads.sourceforge.net/project/aewan/aewan/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('89545338d1eba311297b520f9dc1b976')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	CFLAGS="$CFLAGS -Wno-error=format-security" ./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
