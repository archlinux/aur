# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=dwm-cdown-git
_gitname=dwm
pkgver=0.r1742.82438eb
pkgrel=1
pkgdesc="dwm with cdown's personalisations"
license=('MIT')
url='https://github.com/cdown/dwm'
depends=('libx11' 'libxinerama' 'libxft')
arch=('any')
makedepends=('git')
conflicts=('dwm')
provides=('dwm')

source=('git://github.com/cdown/dwm.git')
md5sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf '0.r%s.%s' \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_gitname"
    make
}

package() {
    cd "$_gitname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
