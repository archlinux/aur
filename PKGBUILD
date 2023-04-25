pkgname=turbo-base64
_pkgname=Turbo-Base64
pkgver=2023.04
pkgrel=1
pkgdesc="Fastest Base64 SIMD Encoding library"
arch=("x86_64")
url="https://github.com/powturbo/Turbo-Base64"
license=("GPL3")
makedepends=("cmake")
source=("https://github.com/powturbo/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f6f47d17641bc170b62b37607746b30faf838fe3ad34dd39f201fe6ce734ad92')

build() {
  cmake -B build -S "$_pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DBUILD_SHARED_LIBS=ON \
        -Wno-dev
  cmake --build build -j $(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:
