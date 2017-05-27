# Maintainer: Maciej Lechowski <mjlechowski@gmail.com>
pkgname=xstarter
pkgver=0.5.2
_gitname=xstarter
pkgrel=1
epoch=
pkgdesc="Terminal-based application launcher for Unix systems "
arch=('any')
url="https://github.com/lchsk/xstarter"
license=('GPL')
groups=()
depends=('ncurses' 'glib2')
makedepends=('git' 'cmake')
checkdepends=()
optdepends=()
provides=('xstarter')
conflicts=('xstarter')
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/lchsk/xstarter/archive/v0.5.2.tar.gz)
noextract=()
md5sums=(f4f2970aff8b44c28711f65b90c7d2cf)
validpgpkeys=()

build() {
	cd "$srcdir/$pkgname-${pkgver}"
	cmake .
	make
}

package() {
	cd "$srcdir/$pkgname-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
