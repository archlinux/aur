# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-sayura
pkgver=0.1.1
pkgrel=2
pkgdesc="Sinhala Transe IME engine for fcitx."
arch=('i686' 'x86_64')
url="https://github.com/fcitx/fcitx-sayura"
license=('GPL')
depends=('fcitx')
makedepends=('cmake' 'intltool')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz")  # {,.sig})
sha512sums=('1eda91ae985df65982cf6f4e67b676bb8eb7117cd1aad7c2a90e81c13fa2a806bbff5eda7bb7e797cb26cb46bbda51931ecffd50384a89ead24ad90777183dc3')
# validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9')  # Weng Xuetian

prepare() {
  mkdir -p build
}

build() {
  cd build
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ../$pkgname-$pkgver
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
