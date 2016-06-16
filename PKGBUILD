# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-qt5
pkgver=1.0.5
pkgrel=4
pkgdesc="Qt5 IM Module for Fcitx"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
groups=('fcitx-im')
depends=('fcitx' 'libxkbcommon' 'qt5-base=5.7.0')
makedepends=('extra-cmake-modules')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha512sums=('f4da9ede8918cef7aa0dbacea534ab81024e3c6d812bedd287c4c4c9a8b9ca994d4708489c602967f3504ce057ec6e118674503f5d796883f1890e8ecc11c501'
            'SKIP')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9')  # Weng Xuetian

build() {
  cd ${pkgname}-${pkgver}

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=lib .
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make install DESTDIR="${pkgdir}"
}
