# Maintainer: Murtaza Udaipurwala <murtaza@murtazau.xyz>
pkgname=transmission-remote-tui-git
_gitname=${pkgname%-git}
pkgrel=1
pkgver=0.1r58.ab0a415
pkgdesc="A TUI for BitTorrent client Transmission"
arch=('any')
url="https://github.com/murtaza-u/transmission-remote-tui"
license=('GPL3')
makedepends=("git" "go" "make")
provides=("trt")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf "0.1r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_gitname"
    make
}

package() {
    cd "$_gitname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
