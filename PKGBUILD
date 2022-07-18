# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=mangareader
pkgver=2.0.4
pkgrel=1
pkgdesc='Manga Reader for local files'
arch=('x86_64')
url='https://github.com/g-fb/mangareader'
license=('GPL3')
depends=('hicolor-icon-theme' 'kconfig' 'kcoreaddons' 'ki18n' 'kxmlgui' 'kio' 'kconfigwidgets')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'ninja')
source=("https://github.com/g-fb/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('da9d0323f5862b232a844fc7a46cf2fb84149075172c4da6d10c64ff2711cd28')

build() {
  cmake -S $pkgname-$pkgver -B build -G Ninja -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
