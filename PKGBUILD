# Maintainer: Fushan Wen <qydwhotmail@gmail.com>
pkgname=plasma5-wallpapers-xml
pkgver=1.2.0
pkgrel=1
pkgdesc="An image/slideshow wallpaper plugin for KDE Plasma that supports GNOME XML wallpaper format."
arch=('x86_64')
url="https://github.com/easyteacher/plasma-wallpapers-xml"
license=('GPL')
depends=(plasma-framework knewstuff qt5-base qt5-declarative)
makedepends=(cmake extra-cmake-modules)
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8d31c6004c2f6b078a708ef3261323de53bb24a37bd8b2f207a17ac09191f482')

build() {
    cmake -B build -S plasma-wallpapers-xml-$pkgver
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
