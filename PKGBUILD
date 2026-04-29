pkgname=jdpermissionstoreedit
pkgver=1.3
pkgrel=1
pkgdesc="Edit the Flatpak Permission Store"
arch=(x86_64)
url="https://codeberg.org/JakobDev/jdPermissionStoreEdit"
license=("GPL3")
depends=("qt6-base" "flatpak" "xdg-desktop-portal" "hicolor-icon-theme")
makedepends=("cmake" "ninja" "qt6-tools")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdPermissionStoreEdit/archive/${pkgver}.tar.gz")
sha256sums=("503c1c324c039844183c3b5d75b2fd4ed0073fe3748787c9ba789ce53ba87957")

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
