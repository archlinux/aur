# Maintainer: alienzj <alienchuj@gmail.com>

pkgname=yaml-cpp-static
pkgver=0.6.2
pkgrel=1
pkgdesc="YAML parser and emitter in C++, written around the YAML 1.2 spec"
url="https://github.com/jbeder/yaml-cpp"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake')
source=(https://github.com/jbeder/yaml-cpp/archive/yaml-cpp-${pkgver}.tar.gz)
sha512sums=('fea8ce0a20a00cbc75023d1db442edfcd32d0ac57a3c41b32ec8d56f87cc1d85d7dd7a923ce662f5d3a315f91a736d6be0d649997acd190915c1d68cc93795e4')

prepare() {
    mkdir -p yaml-cpp-yaml-cpp-$pkgver/build
}

build() {
    cd yaml-cpp-yaml-cpp-$pkgver/build
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd yaml-cpp-yaml-cpp-$pkgver
    install -Dm644 build/libyaml-cpp.a "$pkgdir"/usr/lib/libyaml-cpp.a
}
