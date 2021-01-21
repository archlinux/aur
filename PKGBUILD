# Maintainer: Orell Garten <orell.garten at rub.de>
pkgname=blazert
provides=('blazert')
pkgver=20.2.1
pkgrel=1
pkgdesc='An open-source, high-performance C++ ray tracing kernel library.'
url='https://github.com/cstatz/blazert'
arch=('any')
license=('BSD')
makedepends=('cmake' 'git' 'make' 'gcc' 'blas' 'lapack' 'blaze' 'tar')
sha256sums=('6df81ee1f394b13aadbd6cb8654202a9499ecdc6d9f25d5573b81a31748dc7bc')
source=("https://github.com/cstatz/blazert/archive/20.2.1.tar.gz")

prepare() {
    tar -xzf "20.2.1.tar.gz" 
}

build() {
    cd $pkgname-$pkgver
    mkdir -p build
    cd build
    cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build .
}

package() {
    cd $pkgname-$pkgver/build
    make DESTDIR="$pkgdir/" install
}

