# Maintainer: Bart De Vries <bart at mogwai dot be>
# Contributor: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kasts
pkgver=23.01.0
pkgrel=1
pkgdesc="Kirigami-based podcast player"
arch=(x86_64 i686 armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/kasts"
license=('GPL2')
depends=('qt5-multimedia' 'qt5-quickcontrols2' 'qtkeychain-qt5' 'purpose'
         'kirigami2' 'ki18n' 'kconfig' 'kcoreaddons' 'ki18n' 'syndication'
         'taglib' 'threadweaver' 'vlc' 'kirigami-addons')
optdepends=('gst-plugins-good: common audio codecs for the gstreamer backend'
            'breeze-icons: provide missing icons'
            'qqc2-desktop-style: improve default style')
makedepends=('extra-cmake-modules' 'qt5-svg' 'qt5-tools')
source=("https://download.kde.org/stable/plasma-mobile/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('6ec76b04fd6c06fa1f3201cb907e9b58ec9b414b35e6ae2cc5d1d6b64b7bbb27')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "${pkgname}-${pkgver}"
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
