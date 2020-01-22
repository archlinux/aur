# Maintainer: alienzj <alienchuj@gmail.com>

pkgname=yaml-cpp-static
pkgver=0.6.3
pkgrel=1
pkgdesc="YAML parser and emitter in C++, written around the YAML 1.2 spec"
url="https://github.com/jbeder/yaml-cpp"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake')
source=(https://github.com/jbeder/yaml-cpp/archive/yaml-cpp-${pkgver}.tar.gz)
sha256sums=('77ea1b90b3718aa0c324207cb29418f5bced2354c2e483a9523d98c3460af1ed')

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
