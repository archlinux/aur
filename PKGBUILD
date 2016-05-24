# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='openrw'
pkgver='latest'
pkgrel='4'
pkgdesc="A re-implementation of Rockstar Games' Grand Theft Auto III"
arch=('i686' 'x86_64')
url='https://github.com/danhedron/openrw'
license=('GPL3')
depends=('bullet' 'boost' 'glm' 'sfml' 'libmad')
makedepends=('git' 'cmake')
install='openrw.install'
source=(
    'https://github.com/danhedron/openrw/archive/master.zip'
    'rwgame.desktop'
)
sha256sums=(
    'SKIP'
    '04dedae018deee3ac37510ab05bd8f446ae203c11833a14eb775fec49119b10e'
)

build() {
    cd openrw-master
    mkdir build
    cd build
    cmake ../
    make
}

package() {
    install -D -m755 "${srcdir}/openrw-master/build/rwgame/rwgame" "${pkgdir}/usr/bin/rwgame"
    install -D -m644 "${srcdir}/rwgame.desktop" "${pkgdir}/usr/share/applications/rwgame.desktop"
}
