# Maintainer: Mihkel Tõnnov <mihhkel-at-gmail-dot-com>

pkgname=liblastfm-qt6-git
pkgver=1.2.0.r81e8f9d
pkgrel=1
pkgdesc="A Qt C++ library for the Last.fm webservices (Qt6 port)"
arch=("x86_64")
url="https://github.com/Mazhoon/liblastfm/"
license=("GPL3")
depends=("qt6-base" "fftw" "libsamplerate")
makedepends=("cmake")
conflicts=("liblastfm-qt6")
provides=("liblastfm-qt6")
source=("git+https://github.com/Mazhoon/liblastfm.git")
sha512sums=("SKIP")

build() {
  mkdir build
  cd build
  cmake ../liblastfm \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_CXX_STANDARD=14 \
    -DBUILD_TESTS=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
} 
