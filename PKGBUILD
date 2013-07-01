# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-sayura
pkgver=0.1.1
pkgrel=1
pkgdesc="Sinhala Transe IME engine for fcitx."
arch=('i686' 'x86_64')
url="https://github.com/fcitx/fcitx-sayura"
license=('GPL')
depends=('fcitx>=4.2.8')
makedepends=('cmake' 'intltool')
install=${pkgname}.install
source=("http://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz")

build() {
  cd "$srcdir"/${pkgname}-${pkgver}

  rm -rf build
  mkdir build
  cd build
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}/build
  make DESTDIR="$pkgdir" install
}

sha512sums=('1eda91ae985df65982cf6f4e67b676bb8eb7117cd1aad7c2a90e81c13fa2a806bbff5eda7bb7e797cb26cb46bbda51931ecffd50384a89ead24ad90777183dc3')
