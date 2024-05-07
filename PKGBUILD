# Maintainer: Andrius Pukšta <andrius.puksta at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=mangareader
pkgver=2.2.1
pkgrel=1
pkgdesc='Manga Reader for local files'
arch=('x86_64')
url='https://github.com/g-fb/mangareader'
license=('GPL3')
depends=('hicolor-icon-theme' 'qt6-base' 'kconfig' 'kcoreaddons' 'ki18n' 'kxmlgui' 'kio' 'kconfigwidgets' 'karchive' 'gettext')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'ninja')
source=("https://github.com/g-fb/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e7804ce8360a478060d8daf0b6389390f7b16140000f2efae56c1b16c6092314')

build() {
  cmake -S $pkgname-$pkgver -B build -G Ninja -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
