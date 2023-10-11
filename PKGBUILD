# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=mlc
pkgver=1.3.212
pkgrel=1
pkgdesc="Media Library Compiler: rips your media library to a lossy compilation"
arch=('i686' 'x86_64')
url="https://git.macaw.me/blue/mlc"
license=('GPL3')
depends=('flac' 'lame' 'libjpeg' 'taglib')
makedepends=('cmake>=3.5' 'gcc>=7.0')
optdepends=()

source=("$pkgname-$pkgver.tar.gz::https://git.macaw.me/blue/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('3309d7ed724e0221ae5162b6b2ed20dc2597ac8cd07ad936194a8042b5b72b4e')
build() {
        cd "$srcdir/$pkgname"
        cmake . -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release
        cmake --build .
}
package() {
        cd "$srcdir/$pkgname"
        DESTDIR="$pkgdir/" cmake --install .
}

