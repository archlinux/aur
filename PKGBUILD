# vim:ts=4:sw=4:expandtab
# xedgewarp -- window manager agnostic pointer warping between outputs
pkgname=xedgewarp-git
pkgver=r136.c338387
pkgrel=1
pkgdesc='xedgewarp is a window manager agnostic tool for pointer warping between outputs'
arch=('i686' 'x86_64')
url='https://github.com/Airblader/xedgewarp'
license=('MIT')
provides=('xedgewarp')
#conflicts=
#groups=
depends=('libxcb' 'xcb-util' 'libxi' 'libx11' 'libxrandr')
makedepends=('git' 'asciidoc')
source=('git://github.com/Airblader/xedgewarp#branch=master')
sha1sums=('SKIP')

_gitname='xedgewarp'

pkgver() {
    cd "$srcdir/$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_gitname"
    make all
}

package() {
    cd "$_gitname"
    make DESTDIR="$pkgdir" install
}
