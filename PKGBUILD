# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-qt5
pkgver=1.1.0
_commit=c8ee4e290bfcd50302553ab3cc7b6234bbdaa204
pkgrel=3
pkgdesc="Qt5 IM Module for Fcitx"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
groups=('fcitx-im')
depends=('fcitx' 'libxkbcommon' 'qt5-base=5.9.1')
makedepends=('extra-cmake-modules' 'git')
source=("git+https://github.com/fcitx/fcitx-qt5.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd ${pkgname}

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=lib .
  make
}

package() {
  cd ${pkgname}
  make install DESTDIR="${pkgdir}"
}
