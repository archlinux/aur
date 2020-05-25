# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-hangul
pkgver=0.3.1
pkgrel=3
pkgdesc="Hangul (Korean) support for fcitx"
arch=('x86_64')
url="https://github.com/fcitx/fcitx-hangul"
license=('GPL2')
depends=('fcitx' 'libhangul')
makedepends=('cmake' 'intltool')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha512sums=('6ad2e34644c9246490a91342a11b186d40702f7e587beeb056ad98538da50dbf9fdc9f298e5b379bef50f63ad5be5da79ba84e60a22b57c330d0a68dd5bf5ca6'
            'SKIP')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9') # Weng Xuetian <wengxt@gmail.com>

prepare() {
  mkdir build
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
