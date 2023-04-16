# Maintainer: Andrius Pukšta <andrius.puksta at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=mangareader
pkgver=2.1.0
pkgrel=1
pkgdesc='Manga Reader for local files'
arch=('x86_64')
url='https://github.com/g-fb/mangareader'
license=('GPL3')
depends=('hicolor-icon-theme' 'kconfig' 'kcoreaddons' 'ki18n' 'kxmlgui' 'kio' 'kconfigwidgets' 'gettext')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'ninja')
source=("https://github.com/g-fb/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b6efda5e3fb9cdd77f483adf0822e85f274cc67201e183a8de51beaa4d805e99')

build() {
  cmake -S $pkgname-$pkgver -B build -G Ninja -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
