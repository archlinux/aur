# Maintainer: VirtualTam <virtualtam@flibidi.net>
pkgname=fortune-mod-protolol-git
pkgver=9f59ff8
pkgrel=1
pkgdesc="A compilation of networking jokes"
url="http://attrition.org/misc/ee/protolol.txt"
arch=('i686' 'x86_64')
license=('custom:WTFPL')
depends=(fortune-mod)
makedepends=(git)
_gitname="fortune-protolol"
source=(git://github.com/virtualtam/fortune-protolol.git)
sha256sums=(SKIP)

pkgver() {
    cd ${srcdir}/${_gitname}
    git describe --always | sed 's|-|.|g'
}

build() {
    cd ${srcdir}/${_gitname}
    # Edit if you wish to change how strings are indexed
    # man strfile for more information
    strfile -r protolol
}

package(){
    mkdir -p ${pkgdir}/usr/share/fortune
    cp ${srcdir}/${_gitname}/protolol ${pkgdir}/usr/share/fortune
    cp ${srcdir}/${_gitname}/protolol.dat ${pkgdir}/usr/share/fortune
}
