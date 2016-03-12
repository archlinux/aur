# Maintainer: Thomas Wucher <arch@thomaswucher.de>
pkgname=qhttpserver
pkgver=r134.ca8f327
pkgrel=1
pkgdesc="A Qt HTTP Server - because hard-core programmers write web-apps in C++ :)"
arch=('i686' 'x86_64' 'arm6h' 'arm7h')
url="https://github.com/nikhilm/qhttpserver"
license=('custom')
groups=()
depends=(qt5-base)
makedepends=('git')
replaces=()
backup=()
options=()
install=
source=('qhttpserver::git+https://github.com/nikhilm/qhttpserver.git')
noextract=()
md5sums=('SKIP')
pkgver() {
    cd "$srcdir/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname}"
    qmake
    make
}

package() {
    cd "$srcdir/${pkgname}"
    mkdir -p "$pkgdir/usr/include"
    cp src/*.h "$pkgdir/usr/include/"
    cp -r lib "$pkgdir/usr/"
}
