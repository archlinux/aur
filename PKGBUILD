pkgname=jdpixelupscaler
pkgver=1.3
pkgrel=1
pkgdesc="Upscale Images per Pixel"
arch=(x86_64)
url="https://codeberg.org/JakobDev/jdPixelUpscaler"
license=("GPL3")
depends=("qt6-base")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdPixelUpscaler/archive/${pkgver}.tar.gz")
sha256sums=("f26231938c2fb0960f0acb808813911ee6c06cada9c8029ca23b2846b86f21a8")

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
