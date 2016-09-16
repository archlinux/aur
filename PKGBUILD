# Maintainer: zlsun <zlsun1995 at gmail dot com>

pkgname=glfx-git
_pkgname=glfx
pkgver=0.7.5
pkgrel=1
pkgdesc="A shader effect compiler for GLSL"
arch=("i686" "x86_64")
url="https://github.com/maizensh/glfx"
license=('BSD2')
depends=('glew')
makedepends=('git' 'cmake')
source=("git+$url")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$_pkgname"
    mkdir build && cd build
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
    make all || return 1
}

package() {
    cd "$srcdir/$_pkgname"
    cd build
    make DESTDIR="$pkgdir/" install || return 1
}
