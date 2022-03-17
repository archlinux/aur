# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=dwm-layoutconfigrules-git
_gitname=dwm
pkgver=0.r1816.bcfb194
pkgrel=1
pkgdesc="dwm with layoutconfigrules patch applied"
license=('MIT')
url='https://github.com/cdown/dwm'
depends=('libx11' 'libxinerama' 'libxft')
arch=('any')
makedepends=('git')
conflicts=('dwm')
provides=('dwm')

source=('git+https://github.com/cdown/dwm.git')
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
