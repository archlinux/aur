# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: lh <jason52lh@gmail.com>

pkgname=fcitx-anthy
pkgver=0.2.2
pkgrel=3
pkgdesc="Fcitx Wrapper for anthy."
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx' 'anthy')
makedepends=('cmake' 'intltool')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha512sums=('a4b1eeba813481cc40617e70bd5ee97d1921dc92bab15cf0bdc059d689c239e46caf9e8aba3403ff6374acfbdea565261a948444fe40fa18d5513797eccbd28d'
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
