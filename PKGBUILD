# Maintainer: Douglas Creager <dcreager@dcreager.net>
pkgname=nereusx-notes-git
pkgver=r131.a4f0a4e
pkgrel=1
pkgdesc="Plane-text notes manager, CLI and TUI"
arch=("x86_64")
url="https://github.com/nereusx/notes"
license=('GPL-3.0')
depends=('ncurses')
makedepends=('git' 'gzip' 'md2roff')
provides=('nereusx-notes')
conflicts=('nereusx-notes')
source=("${pkgname}::git+https://github.com/nereusx/notes")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="$pkgdir" prefix=/usr install
}
