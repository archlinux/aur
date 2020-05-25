# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-skk
pkgver=0.1.4
pkgrel=2
pkgdesc="Fcitx Wrapper for libskk"
arch=('x86_64')
url="https://github.com/fcitx/fcitx-skk"
license=('GPL')
depends=('fcitx-qt5' 'libskk')
makedepends=('cmake')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha512sums=('029d05bbd8d325a1ed7824be007191f2148f1443190b7a781983ddddcc42461327912b5ee2f8171402b6eeea68f95511536273711ee09a3f5ec1eaf901aaac90'
            'SKIP')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9')  # Weng Xuetian

build(){
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
