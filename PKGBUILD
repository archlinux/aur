# Maintainer Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kasts
pkgver=21.12
pkgrel=2
pkgdesc="Kirigami-based podcast player"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/kasts"
license=('GPL2')
depends=('qt5-multimedia' 'qt5-quickcontrols2' 'qtkeychain-qt5' 'purpose' 'kirigami2'
         'ki18n' 'kconfig' 'kcoreaddons' 'ki18n' 'syndication' 'taglib')
makedepends=('extra-cmake-modules' 'qt5-svg' 'qt5-tools')
source=("https://download.kde.org/stable/plasma-mobile/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('601719980e3b9853f8ca136cd48395874c0ecb4eed36b8ee14376129fb85d5e6')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "${pkgname}-${pkgver}"
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
