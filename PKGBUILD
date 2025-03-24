pkgname=jdpermissionstoreedit
pkgver=1.0
pkgrel=1
pkgdesc="Upscale Images per Pixel"
arch=(x86_64)
url="https://codeberg.org/JakobDev/jdPermissionStoreEdit"
license=("GPL3")
depends=("qt6-base" "flatpak" "xdg-desktop-portal")
makedepends=("cmake" "ninja" "qt6-tools")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdPermissionStoreEdit/archive/${pkgver}.tar.gz")
sha256sums=("0fdc0c6a217d192b09aeef03dc8485ac4c18ee02686d7eca8edd637f326a5661")

build() {
    cd jdpermissionstoreedit
    mkdir -p build
    cd build
    cmake .. -G Ninja
    cmake --build .
}

package() {
    cd jdpermissionstoreedit
    cmake --install build --prefix "${pkgdir}/usr"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}