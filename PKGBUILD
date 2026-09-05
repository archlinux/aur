# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=mlc
pkgver=1.3.4
pkgrel=2
pkgdesc="Media Library Compiler: rips your media library to a lossy compilation"
arch=('i686' 'x86_64')
url="https://git.macaw.me/blue/mlc"
license=('GPL3')
depends=('flac' 'lame' 'libjpeg.so' 'taglib')
makedepends=('cmake>=3.5' 'gcc>=7.0')
optdepends=()

source=("$pkgname-$pkgver.tar.gz::https://git.macaw.me/blue/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('885c017f6cbfd4f6519507f2eb34310fbda7c0d60d0212b880788694b598965d')
build() {
        cd "$srcdir/$pkgname"
        cmake . -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release
        cmake --build .
}
package() {
        cd "$srcdir/$pkgname"
        DESTDIR="$pkgdir/" cmake --install .
}

