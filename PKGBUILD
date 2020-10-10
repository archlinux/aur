# Maintainer: Roshless <pkg@roshless.com>

pkgname=lagrange
pkgrel=1
pkgver=0.4.0
pkgdesc="Beautiful Gemini Client"
url="https://git.skyjake.fi/skyjake/lagrange"
arch=("any")
license=("BSD")
source=("https://git.skyjake.fi/skyjake/$pkgname/releases/download/v$pkgver/lagrange-$pkgver.tar.gz")

depends=(
    "openssl"
    "sdl2"
)
makedepends=("cmake" "make")

build() {
    cmake -B build -S "$pkgname-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package() {
    cd build
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}

md5sums=('5b937f948d9daa7e3eb085b7907abe21')
