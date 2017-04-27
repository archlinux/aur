# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-skk
pkgver=0.1.2
pkgrel=3
pkgdesc="Fcitx Wrapper for libskk"
arch=('i686' 'x86_64')
url="https://github.com/fcitx/fcitx-skk"
license=('GPL')
depends=('fcitx-qt4' 'libskk')
makedepends=('cmake')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha512sums=('040ae86a687e036be724d856808dd0c713517c216a44fd9ec65d5da708115681d3a1865947db3fcc597dee19bc350a94114b1b780a90c3444309db15f1a3e868'
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
