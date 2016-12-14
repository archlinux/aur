# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-qt5
pkgver=1.0.6
pkgrel=2
pkgdesc="Qt5 IM Module for Fcitx"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
groups=('fcitx-im')
depends=('fcitx' 'libxkbcommon' 'qt5-base=5.7.1')
makedepends=('extra-cmake-modules')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha512sums=('ea816a3bc324b838d77d7ee67a05853f7f07cbc3c0c1e0a3809fe72084f7e0db8e98623499299712b8b496922e46acb06cf3a1cbd3ff2ef1de92ca5a74d540da'
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
