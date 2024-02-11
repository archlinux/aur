# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qvkbd
pkgver=git20190819
pkgrel=1
pkgdesc="Virtual keyboard written in Qt"
arch=(x86_64)
url="https://github.com/KivApple/qvkbd"
license=(GPL3)
depends=(qt5-declarative qt5-x11extras libxtst hicolor-icon-theme)
source=(https://github.com/KivApple/qvkbd/archive/576287467b76d5f8b7ee40db994358144381827e.zip)
sha256sums=('2ce3441b36412bea68712562560f9b4019422f2875244f6185a2dc8b7698db08')

prepare() {
  mkdir -p build
  mv qvkbd-* qvkbd
}

build() {
  cd build
  qmake ../qvkbd
  make
}

package() {
  install -Dm755 build/qvkbd -t "$pkgdir"/usr/bin/
  install -Dm755 qvkbd/qvkbd.desktop -t "$pkgdir"/usr/share/applications/
  install -Dm644 qvkbd/icons/keyboard.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/qvkbd.svg
}
