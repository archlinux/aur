# Maintainer Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kasts
pkgver=21.07
pkgrel=1
pkgdesc="Kirigami-based podcast player"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/kasts"
license=('GPL2')
depends=('qt5-multimedia' 'qt5-quickcontrols2' 'purpose' 'kirigami2'
         'ki18n' 'kconfig' 'kcoreaddons' 'ki18n' 'syndication')
makedepends=('extra-cmake-modules' 'qt5-svg' 'qt5-tools')
source=("https://download.kde.org/stable/plasma-mobile/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('9910ff2f07b64c31155579820c7978c34071fd273e8c922f505c8d9f32dc6dc7')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "${pkgname}-${pkgver}"
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
