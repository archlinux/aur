# Maintainer: Glaumar glaumar2018@outlook.com
pkgname=poptranslate
pkgver=0.0.9
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/glaumar/PopTranslate/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ff0a2cf160de8d00eb1957c02932365d6f67f3d8081b49fc44acf580de69035b')

build() {
    cmake -B build -S "PopTranslate-$pkgver" -DCMAKE_BUILD_TYPE='None' -DCMAKE_INSTALL_PREFIX='/usr'
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build 
}
