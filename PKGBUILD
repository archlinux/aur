pkgname=jdpixelupscaler
pkgver=1.2
pkgrel=1
pkgdesc="Upscale Images per Pixel"
arch=(x86_64)
url="https://codeberg.org/JakobDev/jdPixelUpscaler"
license=("GPL3")
depends=("qt6-base")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdPixelUpscaler/archive/${pkgver}.tar.gz")
sha256sums=("317872d242ab7ca7dd5bc76a8aa6c647c4f1fbc8a5403ece0f9dce47c37ed2f1")

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
