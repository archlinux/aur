# Maintainer: Glaumar glaumar2018@outlook.com
pkgname=poptranslate
pkgver=0.1.0
pkgrel=1
pkgdesc="Translate the text selected by the mouse in wayland"
arch=(x86_64)
url="https://github.com/glaumar/PopTranslate"
license=(GPL3)
depends=(hicolor-icon-theme
         qt5-base
         kxmlgui
         kwindowsystem
         kglobalaccel
         kguiaddons
         kwidgetsaddons
         kwayland)
makedepends=(cmake git qt5-tools qt5-multimedia)
provides=(poptranslate)
source=("$pkgname-$pkgver.tar.gz::https://github.com/glaumar/PopTranslate/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d863440e3ac7a7eed24e102a69928148073c352da015de84e4bf4eb3effa0407')

build() {
    cmake -B build -S "PopTranslate-$pkgver" -DCMAKE_BUILD_TYPE='None' -DCMAKE_INSTALL_PREFIX='/usr'
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build 
}