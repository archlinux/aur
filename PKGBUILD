# Maintainer: Fushan Wen <qydwhotmail@gmail.com>
pkgname=plasma5-wallpapers-xml
pkgver=1.1.1
pkgrel=1
pkgdesc="An image/slideshow wallpaper plugin for KDE Plasma that supports GNOME XML wallpaper format."
arch=('x86_64')
url="https://github.com/easyteacher/plasma-wallpapers-xml"
license=('GPL')
depends=(plasma-framework knewstuff qt5-base qt5-declarative)
makedepends=(cmake extra-cmake-modules)
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('35870c5be32bb6970fc762e058651177373b54373c73c7dc7f5895cbce53d451')

build() {
    cmake -B build -S plasma-wallpapers-xml-$pkgver
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
