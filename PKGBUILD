# Maintainer: Zan <zan@cock.li>

pkgname=qt-avif-image-plugin-git
pkgver=1
pkgrel=1
pkgdesc='Qt plug-in to allow Qt and KDE based applications to read/write AVIF images.'
arch=(x86_64)
url='https://github.com/novomesk/qt-avif-image-plugin'
license=('BSD')
depends=(qt5-base avif-git)
makedepends=(git extra-cmake-modules)
source=("git+https://github.com/novomesk/qt-avif-image-plugin.git")
sha256sums=('SKIP')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../${pkgname%-git}"
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 $srcdir/LICENSE "/usr/share/licenses/$pkname/LICENSE"
}
