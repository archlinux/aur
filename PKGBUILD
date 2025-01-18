pkgname=jdpixelupscaler
pkgver=1.4
pkgrel=1
pkgdesc="Upscale Images per Pixel"
arch=(x86_64)
url="https://codeberg.org/JakobDev/jdPixelUpscaler"
license=("GPL3")
depends=("qt6-base")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdPixelUpscaler/archive/${pkgver}.tar.gz")
sha256sums=("e1a7eb547cd62bce82dd267ece64bf74a2caadb6454b9089e5c95b4de29d7ee8")

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
