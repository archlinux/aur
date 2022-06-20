# Original: Balló György <ballogyor+arch at gmail dot com>
# Modified back for Qt5: Dmitriy Morozov <archlinux@foxcub.org>

pkgname=qt5-qtspell
_pkgname=qtspell
pkgver=1.0.1
pkgrel=1
pkgdesc='Spell checking for Qt text widgets'
arch=('x86_64')
url='https://github.com/manisandro/qtspell'
license=('GPL3')
depends=('enchant' 'iso-codes' 'qt5-base')
makedepends=('cmake' 'qt5-tools')
source=("https://github.com/manisandro/$_pkgname/archive/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('03bb9ef504dff352e162b91e9da89fb34d236e01da54799db69388dc9ceea4c2')

build() {
  cmake -S $_pkgname-$pkgver -B build -DCMAKE_INSTALL_PREFIX='/usr' -DQT_VER=5
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
