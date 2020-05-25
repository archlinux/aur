# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-sayura
pkgver=0.1.2
pkgrel=2
pkgdesc="Sinhala Transe IME engine for fcitx."
arch=('x86_64')
url="https://github.com/fcitx/fcitx-sayura"
license=('GPL')
depends=('fcitx')
makedepends=('cmake' 'intltool')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz")  # {,.sig})
sha512sums=('2118c95d4f831e5f4e0af0549ae3eb4f16bff8b30b03452837bd14f35fcb524f730b27ceb7c14cf6a4db7400a67070929a75465195b5524187e97c7ca02de466')
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
