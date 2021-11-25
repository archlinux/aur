# Maintainer: Murtaza Udaipurwala <murtaza.u6e24@gmail.com>
pkgname=transmission-remote-tui-git
_gitname=${pkgname%-git}
pkgver=0.0
pkgrel=1
pkgdesc="A TUI for BitTorrent client Transmission"
arch=('any')
url="https://github.com/Murtaza-Udaipurwala/transmission-remote-tui"
license=('GPL3')
depends=("transmission-cli")
makedepends=("make" "git" "go")
provides=("trt")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf "0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_gitname"
	make
}

package() {
	cd "$_gitname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
