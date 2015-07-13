# Maintainer: VirtualTam <virtualtam@flibidi.net>
pkgname=fortune-mod-metalfairytale-git
pkgver=1e53c54
pkgrel=2
pkgdesc="A fairy tale whose hero belongs to one of the many Metal (sub-)genres, served in the marvelous form of fortune cookies!"
url="https://github.com/virtualtam/fortune-metal-fairy-tale"
arch=('i686' 'x86_64')
license=('custom:WTFPL')
depends=(fortune-mod)
makedepends=(git)
_gitname="fortune-metal-fairy-tale"
source=(git://github.com/virtualtam/fortune-metal-fairy-tale.git)
sha256sums=(SKIP)

pkgver() {
    cd ${srcdir}/${_gitname}
    git describe --always | sed 's|-|.|g'
}

build() {
    cd ${srcdir}/${_gitname}
    # Edit if you wish to change how strings are indexed
    # man strfile for more information
    strfile -r metal-fairy-tale-fr
}

package(){
    mkdir -p ${pkgdir}/usr/share/fortune
    cp ${srcdir}/${_gitname}/metal-fairy-tale ${pkgdir}/usr/share/fortune
    cp ${srcdir}/${_gitname}/metal-fairy-tale.dat ${pkgdir}/usr/share/fortune
}
