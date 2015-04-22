# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-qt5
pkgver=1.0.2
pkgrel=1
pkgdesc="Qt5 IM Module for Fcitx"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx' 'libxkbcommon' 'qt5-base=5.4.1')
makedepends=('extra-cmake-modules')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha512sums=('f7075d5334e29fd00c54563182c9cc4027011503aa14d577aa2fb75eb8558c385d91c939f1f21e51850c9c64fc5c396aad5b32fdcc8ddd99c46ec74bd577255d'
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
