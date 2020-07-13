# Maintainer: Oliver Mangold <o.mangold at gmail dot com>
pkgname=xcsyncd
pkgver=190612
pkgrel=1
pkgdesc="A utility for synchronizing X11 clipboards"
arch=('i686' 'x86_64')
url="http://github.com/reconquest/xcsyncd"
#license=()
makedepends=(gengetopt)
source=(
    "git://github.com/reconquest/xcsyncd.git#commit=d457f7a1eb5d4fd43300d5a0946049c37cfb286d"
    makefile.patch
)
sha256sums=(SKIP SKIP)
conflicts=(xcsyncd-git)

prepare() {
    cd "${srcdir}/${pkgname}"
    patch -p0 <../makefile.patch
}

build() {
    cd "${srcdir}/${pkgname}"
    make xcsyncd
}

package() {
    cd "${srcdir}/${pkgname}"
    make install DESTDIR="${pkgdir}"
}
