# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=restclient-cpp-git
pkgver=0.5.2.r45.gfdf722b
pkgrel=1
pkgdesc="A simple REST client for C++"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/mrtazz/restclient-cpp"
license=('MIT')
depends=('curl')
makedepends=('cmake')
provides=('restclient-cpp')
conflicts=('restclient-cpp')
options=()
source=('git+https://github.com/mrtazz/restclient-cpp.git')
b2sums=('SKIP')

pkgver() {
    cd restclient-cpp
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd restclient-cpp
    cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd restclient-cpp
    DESTDIR="$pkgdir/" cmake --install build
}
