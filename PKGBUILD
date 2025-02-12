pkgname=jdpixelupscaler
pkgver=1.5
pkgrel=1
pkgdesc="Upscale Images per Pixel"
arch=(x86_64)
url="https://codeberg.org/JakobDev/jdPixelUpscaler"
license=("GPL3")
depends=("qt6-base")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdPixelUpscaler/archive/${pkgver}.tar.gz")
sha256sums=("532da150163bbe789cfaa834b907bc096c56dd395898faa1ffb4496d3387ff46")

build() {
    cd jdpixelupscaler
    mkdir -p build
    cd build
    cmake ..
    cmake --build .
}

package() {
    cd jdpixelupscaler/build
    cmake --install . --prefix "${pkgdir}/usr"
}
