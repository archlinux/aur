# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=mangareader
pkgver=2.0.2
pkgrel=1
pkgdesc='Manga Reader for local files'
arch=('x86_64')
url='https://github.com/g-fb/mangareader'
license=('GPL3')
depends=('hicolor-icon-theme' 'kconfig' 'kcoreaddons' 'ki18n' 'kxmlgui' 'kio' 'kconfigwidgets')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'ninja')
source=("https://github.com/g-fb/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('07b0a4dcfab16a1c0abe46c1a92fa9750bb5191d9dea7f7f5c76080a9e8294a4')

build() {
  cmake -S $pkgname-$pkgver -B build -G Ninja -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
