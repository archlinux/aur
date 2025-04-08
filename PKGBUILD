pkgname=jdpermissionstoreedit
pkgver=1.1
pkgrel=1
pkgdesc="Edit the Flatpak Permission Store"
arch=(x86_64)
url="https://codeberg.org/JakobDev/jdPermissionStoreEdit"
license=("GPL3")
depends=("qt6-base" "flatpak" "xdg-desktop-portal")
makedepends=("cmake" "ninja" "qt6-tools")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdPermissionStoreEdit/archive/${pkgver}.tar.gz")
sha256sums=("1b9bc6e75e9d8ae9e27a9481e0ffe53d9f37fe4438c0dccfb51dcac33b554383")

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
