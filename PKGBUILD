# Maintainer: Fushan Wen <qydwhotmail@gmail.com>
pkgname=plasma5-wallpapers-xml
pkgver=1.2.1
pkgrel=1
pkgdesc="An image/slideshow wallpaper plugin for KDE Plasma that supports GNOME XML wallpaper format."
arch=('x86_64')
url="https://github.com/easyteacher/plasma-wallpapers-xml"
license=('GPL')
depends=(plasma-framework knewstuff qt5-base qt5-declarative)
makedepends=(cmake extra-cmake-modules)
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b0fffc2d779d7cea7b8c4cfbcd72370d443f47ec243412c310b3b7b22d0ad124')

build() {
    cmake -B build -S plasma-wallpapers-xml-$pkgver
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
