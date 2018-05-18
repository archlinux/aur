# Maintainer: Stephan Springer <buzo+arch@Lini.de>

_pkgname=fortune-mod-fvl
pkgname="$_pkgname"-git
pkgver=r4.5bcd5db
pkgrel=1
pkgdesc="Fortune quotes by Felix von Leitner (Fefe)"
url=https://github.com/yayachiken/"$_pkgname"
arch=(any)
license=(GPL2)
depends=(fortune-mod)
makedepends=(git)
source=(git+https://github.com/yayachiken/"$_pkgname".git)
sha256sums=(SKIP)

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" \
           "$(git rev-list --count HEAD)" \
           "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    strfile fvl
    strfile fvl_vendor
}

package(){
    mkdir -p "$pkgdir"/usr/share/fortune
    cp "$_pkgname"/fvl{,_vendor}{,.dat} "$pkgdir"/usr/share/fortune
}
