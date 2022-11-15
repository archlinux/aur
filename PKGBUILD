# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-googlepinyin
pkgver=0.1.6
pkgrel=7
pkgdesc="Fcitx Wrapper for googlepinyin"
arch=('x86_64')
url="https://github.com/fcitx/fcitx-googlepinyin"
license=('GPL')
depends=('fcitx' 'libgooglepinyin')
makedepends=('cmake' 'intltool')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('29a5506ed45d26534f7bcbca1c56138984dcc7e99a42652c6a49fe20ec0da781')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  rm -rf build
  mkdir build
  cd build
    
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
