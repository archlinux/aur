# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qt5-gsettings
pkgver=1.4.0
pkgrel=1
pkgdesc="Qt-style wrapper for GSettings"
arch=('x86_64')
url="https://github.com/lirios/qtgsettings"
license=('LGPL3')
depends=('qt5-declarative' 'glib2')
makedepends=('liri-cmake-shared' 'python')
groups=('liri')
source=("https://github.com/lirios/qtgsettings/releases/download/v${pkgver}/qtgsettings-${pkgver}.tar.xz")
sha512sums=('f8e32e5df3c4a9810c9a207e5acb5909e4e30cefabf54746dc223a878a9d10fe473a8634d82e71abc52b7259bb6c6c35d872b1c7b1b19964633d9967b0cd70ec')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../qtgsettings-$pkgver
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
