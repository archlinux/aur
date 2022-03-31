# Maintainer: Brandon Clifford <brandon099 at gmail dot com>

_gitname=raw2dng
pkgname="$_gitname-git"
pkgver=r55.f2e9019
pkgrel=1
pkgdesc="Linux utility for converting raw photo files into DNG, TIFF and JPEG formats."
arch=('i686' 'x86_64')
url="https://github.com/Fimagena/raw2dng"
license=('unknown')
depends=()
provides=('raw2dng')
conflicts=()
makedepends=('git' 'make' 'cmake' 'libjpeg-turbo' 'exiv2' 'libraw')
source=("git+https://github.com/Fimagena/$_gitname.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_gitname}"
    cmake .
    make
}

package() {
    cd "${srcdir}/${_gitname}"
    make DESTDIR="$pkgdir" install
}
