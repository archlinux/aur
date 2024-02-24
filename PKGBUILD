# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=st-xres-git
_gitname=st
pkgver=0.r1167.9dd13f2
pkgrel=1
pkgdesc="st with xresources patch applied"
license=('MIT')
url='https://github.com/cdown/st'
depends=('libxft')
arch=('any')
makedepends=('git')
conflicts=('st')
provides=('st')

source=('git+https://github.com/cdown/st.git')
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
