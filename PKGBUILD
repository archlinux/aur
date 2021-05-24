# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=mangareader
pkgver=1.5.0
pkgrel=1
pkgdesc='Manga Reader for local files'
arch=('x86_64')
url='https://gitlab.com/g-fb/mangareader'
license=('GPL3')
depends=('hicolor-icon-theme' 'kconfig' 'kcoreaddons' 'ki18n' 'kxmlgui' 'libarchive')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'ninja')
source=("https://gitlab.com/g-fb/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('34b6dc38a5b0e8c4c343e4099ce6c525b0992622dd6c841486d8a020074fb0e6')

build() {
  cmake -S $pkgname-$pkgver -B build -G Ninja -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
