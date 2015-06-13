# Maintainer: Erdal Mutlu <erdal at sisiya dot org>
pkgname=sisiya-edbc-libs
pkgver=0.6.31
pkgrel=1
epoch=
pkgdesc="The SisIYA EDBC libraries."
arch=('i686' 'x86_64')
url="http://www.sisiya.org"
license=('GPL2')
groups=()
depends=('libmariadbclient' 'postgresql-libs')
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
#source=("$pkgname-$pkgver.tar.gz")
source=("http://sourceforge.net/projects/sisiya/files/sisiya/$pkgver/pacman/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('82a7f3dfa787b00ef920663704da25e1') #generate with 'makepkg -g'

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./bootstrap create
	./configure --prefix=
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make "DESTDIR=$pkgdir/" install
}
