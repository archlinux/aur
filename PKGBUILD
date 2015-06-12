# Maintainer: Matthias Blankertz <matthias at blankertz dot org>
pkgname=msc-generator
pkgver=4.5.0
pkgrel=1
epoch=
pkgdesc="Draws MSCs from textual descriptions"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/msc-generator/"
license=('AGPL3')
groups=()
depends=(cairo)
makedepends=(help2man texlive-plainextra)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=msc-generator.install
changelog=

source=("http://sourceforge.net/projects/msc-generator/files/msc-generator/v4.5/msc-generator-4.5.tar.gz")
noextract=()
sha256sums=('6e96c068ada1e60327aafb64cc8c5821def916b12ed995fce05bc1561196878b')

build() {
	cd "$srcdir/$pkgname-4.5"
	aclocal
	automake -a
	autoconf
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-4.5"
	make check
}

package() {
	cd "$srcdir/$pkgname-4.5"
	make DESTDIR="$pkgdir/" install
}
