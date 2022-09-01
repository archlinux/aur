# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=peruse
pkgver=1.80
pkgrel=2
pkgdesc='Comic book viewer and creator based on KDE Frameworks 5'
arch=('x86_64')
url='https://peruse.kde.org/'
license=('GPL')
depends=('kconfig' 'kdeclarative' 'kfilemetadata' 'ki18n' 'kiconthemes' 'kio' 'kirigami2'
         'knewstuff')
makedepends=('cmake' 'extra-cmake-modules' 'ninja')
optdepends=('baloo: find books on the system'
            'okular: support for various document formats')
source=("https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('c674959ca176d236f1568156e35036d8d65655952bcbf17b1be4ece4d2ba3351')

build() {
  cmake -S $pkgname-$pkgver -B build -G Ninja -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
