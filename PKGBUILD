# Maintainer: Bart De Vries <bart at mogwai dot be>
# Contributor: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kasts
pkgver=22.09.2
pkgrel=1
_plamover=22.09
pkgdesc="Kirigami-based podcast player"
arch=(x86_64 i686 armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/kasts"
license=('GPL2')
depends=('qt5-multimedia' 'qt5-quickcontrols2' 'qtkeychain-qt5' 'purpose'
         'kirigami2' 'ki18n' 'kconfig' 'kcoreaddons' 'ki18n' 'syndication'
         'taglib' 'threadweaver')
makedepends=('extra-cmake-modules' 'qt5-svg' 'qt5-tools')
source=("https://download.kde.org/stable/plasma-mobile/${_plamover}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('a9b43dce4b91fd5f92f4b3af44b08ae55c7b7c3a496a88f045718219265a2082')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "${pkgname}-${pkgver}"
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
