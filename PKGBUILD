# Maintainer: Vlad Zahorodnii <vladzzag@gmail.com>
pkgname=plasma5-wallpapers-dynamic
pkgver=5.0.1
pkgrel=1
pkgdesc="Dynamic wallpaper plugin for KDE Plasma"
arch=(x86_64)
url="https://github.com/zzag/plasma5-wallpapers-dynamic"
license=('GPL')
depends=(libavif libexif libplasma qt6-base qt6-declarative qt6-location)
makedepends=(cmake extra-cmake-modules)
optdepends=('geoclue: automatic location detection support')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/zzag/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('0364434ec647353cf84daa14684342171a070814f1d8093f498c58d6c624956d')

build() {
    cmake -B build -S $pkgname-$pkgver
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
