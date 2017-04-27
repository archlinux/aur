# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-m17n
pkgver=0.2.3
pkgrel=1
pkgdesc="Fcitx Wrapper for m17n"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx' 'm17n-lib')
makedepends=('cmake')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz")  # {,.sig})
sha512sums=('6e78b70fb2e3139a59f49d25026c075893a8f192dd2083641ab3e56595a4f631ff13307dd647fd0eedd510dade690d97b44cbdeca96e086855f73910dc5d02af')
# validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9')  # Weng Xuetian

build() {
  cd $pkgname-$pkgver
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
