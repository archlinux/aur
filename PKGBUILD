# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Gno <noreply@gno.com>
pkgname=caelestia-gif
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="A script to manage and change GIFs in Caelestia shell"
arch=('x86_64')
url="https://gitlab.com/gnoooo/caelestia-gif.git"
license=('GPL')
groups=()
depends=('imagemagick' 'cjson' 'xdg-open' 'ncurses' 'bash')
makedepends=('git' 'base-devel')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://gitlab.com/gno/caelestia-gif.git#branch=main")
noextract=()
sha256sums=()
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
