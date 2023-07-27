# Maintainer: JustKidding <jk@vin.ovh>

pkgname=turbo-base64
_pkgname=Turbo-Base64
pkgver=2023.08
pkgrel=1
pkgdesc="Fastest Base64 SIMD Encoding library"
arch=("any")
url="https://github.com/powturbo/Turbo-Base64"
license=("GPL3")
makedepends=("cmake")
source=("https://github.com/powturbo/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('72f22c31534502d715ebc0158932fdbdf1133cdadedfdaba6fea598ca0c0808e')

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
