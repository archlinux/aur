# Maintainer: Yury Gubich <blue@***>
pkgname=mlc
pkgver=1.3.23
pkgrel=1
pkgdesc="Media Library Compiler: rips your media library to a lossy compilation"
arch=('i686' 'x86_64')
url="https://git.***/blue/mlc"
license=('GPL3')
depends=('flac' 'lame' 'libjpeg' 'taglib')
makedepends=('cmake>=3.5' 'gcc>=7.0')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://git.***/blue/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('12691ffeec6b3a8d770e5bd0a24e34ca079ca96a474e0053fff9676dc2c27563')
build() {
        cd "$srcdir/$pkgname"
        cmake . -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release
        cmake --build .
}
package() {
        cd "$srcdir/$pkgname"
        DESTDIR="$pkgdir/" cmake --install .
}
