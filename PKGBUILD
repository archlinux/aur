# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-skk
pkgver=0.1.1
pkgrel=1
pkgdesc="Fcitx Wrapper for libskk"
arch=('i686' 'x86_64')
url="https://github.com/fcitx/fcitx-skk"
license=('GPL')
depends=('fcitx-qt4' 'libskk')
makedepends=('cmake')
install=$pkgname.install
source=("http://download.fcitx-im.org/${pkgname}/${pkgname}-${pkgver}.tar.xz")

build(){
  cd ${pkgname}-${pkgver}
 
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

sha512sums=('2482d5bd1f8ed10bc368164930f1bbbbb12f3475e777f09cf0234deca29f9ec90c0fdc5f207d3f9a8a49ef2d34f1aceae1eb5872cd2f0b5e3c678b3e4689df51')
