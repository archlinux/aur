# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='openrw'
pkgver='latest'
pkgrel='2'
pkgdesc="A re-implementation of Rockstar Games' Grand Theft Auto III"
arch=('i686' 'x86_64')
url='https://github.com/danhedron/openrw'
license=('GPL3')
depends=('bullet' 'boost' 'glm' 'sfml')
makedepends=('cmake')
install='openrw.install'
backup=('etc/openrw.conf')
source=(
    'https://github.com/danhedron/openrw/archive/master.zip'
    'openrw.conf'
    'rwgame.desktop'
)
sha256sums=(
    'SKIP'
    '77a1d2078b2ae591bbaac08d823ffeb91957b445e1b53f25a049901e63156471'
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
    install -D -m644 "${srcdir}/openrw.conf" "${pkgdir}/etc/openrw.conf"
    install -D -m644 "${srcdir}/rwgame.desktop" "${pkgdir}/usr/share/applications/rwgame.desktop"
}
