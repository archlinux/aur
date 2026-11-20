# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=mlc
pkgver=1.3.5
pkgrel=1
_tag="1.3.5"
pkgdesc="Media Library Compiler: rips your media library to a lossy compilation"
arch=('i686' 'x86_64')
url="https://git.macaw.me/blue/mlc"
license=('GPL3')
depends=('flac' 'lame' 'libjpeg.so' 'taglib')
makedepends=('cmake>=3.5' 'gcc>=7.0')
optdepends=()

source=("$pkgname-$_tag.tar.gz::https://git.macaw.me/blue/$pkgname/archive/$_tag.tar.gz")
sha256sums=('860798114158cc9dc9f5499378341b163b7f85c61a69049e49b54b8a85280b08')
build() {
        cd "$srcdir/$pkgname"
        cmake . -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release
        cmake --build .
}
package() {
        cd "$srcdir/$pkgname"
        DESTDIR="$pkgdir/" cmake --install .
}

