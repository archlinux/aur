# Maintainer: Vlad Zahorodnii <vladzzag@gmail.com>
pkgname=heifthumbnailer
pkgver=1.0
pkgrel=1
pkgdesc="KIO HEIF thumbnailer"
arch=(x86_64)
url="https://github.com/zzag/heifthumbnailer"
license=('GPL')
depends=(qt5-base kio libheif)
makedepends=(cmake extra-cmake-modules)
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/zzag/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('e129a169f618def9ae185aa88d73126c4b50960694e47c073b5b38100ae0004c')

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../$pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
