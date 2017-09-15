# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgname=fcitx-kkc
pkgver=0.1.3
pkgrel=1
pkgdesc="Fcitx Wrapper for libkkc"
arch=('i686' 'x86_64')
url="https://github.com/fcitx/fcitx-kkc"
license=('GPL')
depends=('fcitx' 'libkkc' 'libkkc-data' 'skk-jisyo' 'fcitx-qt4')
makedepends=('cmake')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha512sums=('337c1692117374ea4e612debd2feac6a4f5975db0470846f3aaeaa8d145cc1ed6efdea879e5ed4d6257287de7a7d52f40411307ae130c4b73e76349141d04131'
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
