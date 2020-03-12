# Maintainer: Joakim Reinert <mail+aur@jreinert.com>

_gitname=xftwidth
pkgname=${_gitname}-git
pkgver=r26.35ff963
pkgrel=2
pkgdesc='Calculate the width in pixels of a string using a given Xft font'
arch=(x86_64)
url="http://github.com/vixus0/xftwidth"
license=(MIT)
makedepends=(git)
depends=(libxft libx11 fontconfig freetype2)
provides=($_gitname)
conflicts=($_gitname)

source=('git+https://github.com/vixus0/xftwidth.git')

sha512sums=(SKIP)

build() {
    cd "$srcdir/$_gitname"
    make
}

pkgver() {
    cd "$srcdir/$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_gitname"
    make install DESTDIR="$pkgdir"
}
