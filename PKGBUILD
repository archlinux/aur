# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-skk
pkgver=0.1.3
pkgrel=1
pkgdesc="Fcitx Wrapper for libskk"
arch=('i686' 'x86_64')
url="https://github.com/fcitx/fcitx-skk"
license=('GPL')
depends=('fcitx-qt4' 'libskk')
makedepends=('cmake')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha512sums=('601263a164536f2eac76f2fd6e8861abda8faf47adb31b2475b509db2620e8791a11b626109c8b2b9e52fb571b2c483b5e272a6fb35f6f9a4c129b26a5851245'
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
