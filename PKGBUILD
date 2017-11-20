# Maintainer: Falk Alexander Seidl <fa@terminal.run>

pkgname=fractal-git
_gitname=fractal
pkgver=r225.e693b8d
pkgrel=1
pkgdesc="Matrix.org gtk+ client"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://gitlab.gnome.org/danigm/fractal"
depends=('gtk3')
makedepends=('gtk3' 'rust' 'pkg-config' 'git')
source=("git://github.com/danigm/fractal")
md5sums=('SKIP')
 
pkgver() {
	cd "${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}/"
	./configure --prefix=/usr/local
	make
}

package() {
	cd "${srcdir}/${_gitname}/"
	make DESTDIR="$pkgdir" install
}
