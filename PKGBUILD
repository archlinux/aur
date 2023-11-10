# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kmarkdownwebview
pkgver=0.5.5
pkgrel=2
pkgdesc='KPart for rendering Markdown content'
url='https://www.kde.org'
license=(LGPL)
arch=(x86_64)
depends=(kparts5 qt5-webengine)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('3bbdde1b52d1e11045df6a05b14484331efcfe740a98708e4bdfa334a8f3ee96'
            'SKIP')
validpgpkeys=(E191FD5BE6F46870F09E82B2024E7FB43D015474) # Friedrich W. H. Kossebau <kossebau@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
