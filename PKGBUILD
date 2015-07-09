# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Markus Martin <markus@archwyrm.net>
pkgname=yaml-cpp0.3
pkgver=0.3.0
pkgrel=1
pkgdesc="YAML parser and emitter in C++, written around the YAML 1.2 spec"
url="http://code.google.com/p/yaml-cpp/"
arch=('i686' 'x86_64')
license=('MIT')
makedepends=('cmake')
conflicts=("yaml-cpp")
provides=("yaml-cpp=$pkgver")
source=(http://yaml-cpp.googlecode.com/files/yaml-cpp-$pkgver.tar.gz)
md5sums=('9aa519205a543f9372bf4179071c8ac6')

build() {
    cd "$srcdir"/yaml-cpp

    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=ON
    make
}

package() {
    cd "$srcdir"/yaml-cpp

    make DESTDIR="$pkgdir" install
}
